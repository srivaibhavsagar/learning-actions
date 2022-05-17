git clone https://github.com/srivaibhavsagar/terraform--poc.git
cd terraform--poc/Services/main
terraform init --backend-config='../../template/backend_config.hcl'
terraform plan
terraform apply --auto-approve
