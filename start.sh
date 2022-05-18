git clone https://github.com/srivaibhavsagar/terraform--poc.git

cd terraform--poc/Services/main

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
terraform plan
terraform apply --auto-approve




