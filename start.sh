git clone https://github.com/srivaibhavsagar/terraform--poc.git

cd terraform--poc/Services/main

rm -rf backend.tf

USAGE=$(cat <<-END
    terraform {
  required_version = ">= 0.12"
  backend "s3" {
    key = "module-state/${1}/terraform.tfstate"
  }
}
END
)

echo $USAGE >> backend.tf


terraform init --backend-config='../../template/backend_config.hcl'
terraform plan
terraform apply --auto-approve




