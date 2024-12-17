# Get the root directory of the repository
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)


# cd $REPO_ROOT/modules/s3-backend
# terraform init
# terraform fmt
# terraform validate
# terraform plan
# terraform apply -auto-approve


# cd $REPO_ROOT/resources/dev/ec2-instance
# terraform init
# terraform fmt
# terraform validate
# terraform plan
# terraform apply -auto-approve


cd $REPO_ROOT/resources/dev/vpc-1-or-3nats
terraform init 
terraform fmt
terraform apply -auto-approve 

# cd $REPO_ROOT
# cd terraform/resources/dev/bastion-host
# terraform init 
# terraform fmt
# terraform apply -auto-approve 