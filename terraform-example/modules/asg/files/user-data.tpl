#!/bin/bash -xe

# set basic environment variables
echo 'export http_proxy="http://proxy-${vpc_name_lc}.aws.***.com:8080"'>> /etc/environment
echo 'export https_proxy="http://proxy-${vpc_name_lc}.aws.***.com:8080"'>> /etc/environment
echo 'export NO_PROXY=169.254.169.254,.aws.****.com,.****.com,localhost,127.0.0.1' >> /etc/environment
echo 'export AWS_REGION=us-east-1' >> /etc/environment
source /etc/environment

mkdir /opt/downloads

# disable SElinux
setenforce 0
sed -i -e "s/SELINUX=.*/SELINUX=disabled/g" /etc/sysconfig/selinux

# security stuff
sed -i -e "s/mirrorlist/#mirrorlist/g" /etc/yum.repos.d/CentOS-Base.repo || true    #dont use mirrors
sed -i -e "s/#baseurl/baseurl/g" /etc/yum.repos.d/CentOS-Base.repo || true          #dont use mirrors
echo "Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr" >> /etc/ssh/sshd_config
echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com" >> /etc/ssh/sshd_config

# add user 'mcs'
useradd mcs
#echo "${password}" | passwd --stdin mcs
usermod -aG wheel mcs
#echo "Match User mcs" >> /etc/ssh/sshd_config
#sed -e 's/PasswordAuthentication no/PasswordAuthentication yes/' -i.bak /etc/ssh/sshd_config

systemctl restart sshd.service

echo ${vpc_name_lc} > /etc/env_name
echo "${component_name}.${domain_name}" > /etc/dns_name

# change default user to 'awsadmin'
default_user=$(grep " name:" /etc/cloud/cloud.cfg | awk '{print $2}')
usermod -l awsadmin -d /home/awsadmin $default_user
groupmod -n awsadmin $default_user
mv /home/$default_user /home/awsadmin
sed -i -e "s/$default_user/awsadmin/g" /etc/sudoers
find /etc/sudoers.d/ -type f -exec sed -i -e s/$default_user/awsadmin/g {} \;

# add extra repos used for installing pip
yum-config-manager --enable rhui-REGION-rhel-server-extras || true
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# install software
yum install -y python2-pip ansible wget git unzip python-lxml
pip install awscli boto3 docker-py

#curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
#yum -y install nodejs

/bin/aws --region=us-east-1 s3 cp s3://aws-"${cloud}"-deployment/wmuser-knlhe /opt/downloads/id_rsa
cp /opt/downloads/id_rsa /root/.ssh/id_rsa ; chmod 0600 /root/.ssh/id_rsa
ssh-keyscan github.com > ~/.ssh/known_hosts
cd /opt/downloads/ ; git clone git@github.com:****/do-mobile.git && cd do-mobile/playbooks

# kick off provisioning process
ansible-playbook deploy.yml -e \
                  init=true \
                  -e cloud="${cloud}" \
                  -e proxy="${proxy}" \
                  -e component_name="${component_name}" \
                  -e env="${env_name}" \
