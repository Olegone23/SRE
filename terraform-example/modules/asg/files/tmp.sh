#!/bin/bash -xe
echo 'export http_proxy=>> /etc/environment
echo 'export https_proxy=>> /etc/environment
echo 'export NO_PROXY=169.254.169.254,.aws.***.com,localhost,127.0.0.1' >> /etc/environment
source /etc/environment
setenforce 0
mkdir /opt/downloads
sed -i -e 's/SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
yum-config-manager --enable rhui-REGION-rhel-server-extras || true 
echo > /etc/env_name
echo > /etc/dns_name

useradd tester
echo tester | passwd --stdin tester
       
sed -e 's/requiretty/!requiretty/' -i.bak /etc/sudoers
echo \"\" >> /etc/ssh/sshd_config
echo \"Ciphers aes128-ctr,aes192-ctr,aes256-ctr,,aes128-gcm@openssh.com,aes256-gcm@openssh.com,chacha20-poly1305@openssh.com\" >> /etc/ssh/sshd_config
echo \"MACs hmac-sha1-etm@openssh.com,umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-ripemd160-etm@openssh.com,hmac-sha1,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-ripemd160\" >> /etc/ssh/sshd_config

useradd sshtest
echo abc123 | passwd --stdin sshtest
usermod -a sshtest -G wheel
echo \"Match User sshtest,tester\" >> /etc/ssh/sshd_config
echo \"PasswordAuthentication yes\" >> /etc/ssh/sshd_config
       
systemctl restart sshd.service
default_user=$(grep \" name:\" /etc/cloud/cloud.cfg | awk '{print $2}')
usermod -l awsadmin -d /home/awsadmin $default_user
groupmod -n awsadmin $default_user
mv /home/$default_user /home/awsadmin
sed -i -e s/$default_user/awsadmin/g /etc/sudoers
find /etc/sudoers.d/ -type f -exec sed -i -e s/$default_user/awsadmin/g {} \\;
sed -i -e 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo || true
sed -i -e 's/metalink/#metalink/g' /etc/yum.repos.d/CentOS-Base.repo || true

sed -i -e 's/#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-Base.repo || true
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum clean all
yum makecache
yum install -y python2-pip ansible wget git python-lxml unzip
pip install awscli
/bin/aws --region=us-east-1 s3 cp s3://aws--deployment/wmuser-knlhe /opt/downloads/id_rsa
cp /opt/downloads/id_rsa /root/.ssh/id_rsa ; chmod 0600 /root/.ssh/id_rsa
ssh-keyscan github.com > ~/.ssh/known_hosts
cd /opt/downloads/ ; git clone git@github.com:wiley/do-mobile.git  && cd do-mobile/playbooks
ansible-playbook deploy.yml -e
 init=true
 -e cloud=
 -e proxy=
 -e component_name=
 -e env=
