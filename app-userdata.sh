#!bin/bash
artifact_id=`packer build -machine-readable manifest11.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
ami_id=`echo $artifact_id | cut -d ':' -f2`
#echo 'variable "ami_id" { default = "'${ami_id}'" }' > varami.tf
terraform init -var ami=”$ami_id”
terraform apply -var ami=”$ami_id” -input=false -auto-approve 


#!bin/bash
artifact_id=`packer build -machine-readable manifest11.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
ami_id=`echo $artifact_id | cut -d ':' -f2`
#echo 'variable "ami_id" { default = "'${ami_id}'" }' > varami.tf
#sleep 60
set | grep ami_id
export ami_id
terraform init -var ami= $ami_id
terraform apply -var ami= $ami_id -input=false -auto-approve
