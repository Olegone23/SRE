set_prod () {
/bin/aws sts assume-role --role-arn arn:aws:iam::***:role/aws-prod-devops-resource-ec2 --role-session-name "RoleSessionname" | grep -w 'AccessKeyId\|SecretAccessKey\|SessionToken' | tr -s " " |  sed -e "s/^\ //" | awk '{print $2}' | tr -d "," | tr -d "\"" > prod_creds
export AWS_ACCESS_KEY_ID=`sed -n '3p' prod_creds`
export AWS_SECRET_ACCESS_KEY=`sed -n '1p' prod_creds`
export AWS_SECURITY_TOKEN=`sed -n '2p' prod_creds`
rm prod_creds
}
set_prod
