git clone https://github.com/srivaibhavsagar/terraform--poc.git

cd terraform--poc/Services/day2

rm -rf backend.tf

USAGE=$(cat <<-END
    terraform {\n
  required_version = ">= 0.12"\n
  backend "s3" {\n
    key = "module-state/${1}/terraform.tfstate"\n
  }\n
}\n
END
)

echo $USAGE >> backend.tf


terraform init --backend-config='../../template/backend_config.hcl' 
terraform plan -var "type_instance=$2" -var "name_instance=$1"
terraform apply --auto-approve -var "type_instance=$2" -var "name_instance=$1"




