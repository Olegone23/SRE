#!/usr/bin/env bash

instanceId=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
ec2AvailZone=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
ec2Region="`echo \"$ec2AvailZone\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"
tagFile=/tmp/aws_tags

aws ec2 describe-tags --region $ec2Region --filters "Name=resource-id,Values=$instanceId" | \
  python -c "import sys,json; map(lambda t: sys.stdout.write('export TAG_%s=\"%s\"\n' % (t['Key'], t['Value'])), json.load(sys.stdin)['Tags'])" | grep -v aws > $tagFile
if grep -q ServiceEnvName /etc/environment; then
  echo "system environment already set"
else
  echo "creating system env file with aws tags"
  cat $tagFile | tee -a /etc/environment > /dev/null
fi
#DT_TAGS=$(cat $tagFile | sed  's/export//g; s/TAG_//g; s/\"//g; s/^\ //g; s/\ /_/g'| tr -s '\n' ' ')
echo "creating dynatrace oneagent tags file"
# cat $tagFile | sed  's/export//g; s/TAG_//g; s/\"//g; s/^\ //g; s/\ /_/g'| tee /opt/dynatrace/oneagent/agent/conf/hostautotag.conf | tee /var/lib/dynatrace/oneagent/agent/config/hostautotag.conf > /dev/null
cat $tagFile | sed  's/export//g; s/TAG_//g; s/\"//g; s/^\ //g; s/\ /_/g'| tee /var/lib/dynatrace/oneagent/agent/config/hostautotag.conf > /dev/null
echo "done"
