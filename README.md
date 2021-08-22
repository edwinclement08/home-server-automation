# Home Automation

## DigitalOcean Terraform Provisioning

Steps to use this.

1. Get a DigitalOcean Token from [here](https://cloud.digitalocean.com/account/api)
2. Run `export DIGITALOCEAN_ACCESS_TOKEN=<API TOKEN>` in your local shell
3. `cd terraform`
4. Generate a new SSH key pair
```
ssh-keygen -t rsa -C "<email>" -f ./terraform-digitalocean
```
5. Copy over the generated public ssh into `terramino_app.yaml`
6. Initialize terraform using `terraform init`
7. Check what changes are gonna be done using `terraform plan`
8. Apply the changes using `terraform apply`
   The public IP of the resource will be outputted after command completion.