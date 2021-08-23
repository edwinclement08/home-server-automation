# Home Automation

## Setup

### DigitalOcean Terraform Setup

1. Get a DigitalOcean Token from [here](https://cloud.digitalocean.com/account/api)
2. Run `export DIGITALOCEAN_ACCESS_TOKEN=<API TOKEN>` in your local shell
4. In this repo, ssh keys that you use for github are used for authentication with provisioned servers
   Change edwinclement08 to your Github Username in the file `terraform/base-cloud-init.yaml`
   ```
   ssh_import_id:
      - gh:edwinclement08
   ```
### Ansible 

1. Create a python3 virtual Environment using.
```
cd ~/python-venvs
python3 -m virtualenv ansible
```
  Note: I keep all my virtual environments in the same dir ~/python-venvs
2. Activate the virtual environment
```
source ~/python-venv/ansible/bin/activate
```
3. Install ansible using
```
pip install ansible
```
4. Make sure ansible is working with 
```
ansible --version          
```

## Usage
First, we need to provision the Resources using Terraform

1. Initialize terraform using `make tf-init`
2. Check what changes are gonna be done using `make tf-plan`
3. Apply the changes using `make tf-apply`
   The public IP of the resource will be outputted after command completion.
   An Ansible inventory file will be generated in the directory `ansible`

   In case you want to ssh into the provisioned instance, you can use the IP from here

## Testing Ansible can connect to the provisioned resources

1. Make sure that you have activated the ansible virtual environment
2. Running `ansible all -m ping` should give you a success.
   Something like this
```
165.22.222.94 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```
