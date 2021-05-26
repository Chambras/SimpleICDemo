# Simple Demo Environment

Just a simple demo where I show case integration with [GitHub Actions](https://docs.github.com/en/free-pro-team@latest/actions), and [Terraform Cloud](https://www.terraform.io/docs/cloud/index.html)

It creates the following resources:

- A new Resource Group.
- A Storage Account.
- A new File Share.
- A Windows VM.
- A RedHat VM.
- A VNet.
- 2 subnets to host the RedHat and the Windows VMs.
- 2 Network Security Groups one for SSH and one for RDP access.

## Project Structure

This project has the following files which make them easy to reuse, add or remove.

```ssh
├── LICENSE
├── README.md
├── devRHVM.tf
├── devWinVM.tf
├── main.tf
├── networking.tf
├── outputs.tf
├── security.tf
├── storage.tf
├── variables.tf
├── variablesDevRHVM.tf
├── variablesDevWinVM.tf
├── variablesNetwork.tf
├── variablesSecurity.tf
├── variablesStorage.tf
```

Most common parameters are exposed as variables in _`variables*.tf`_ files.

## Pre-requisites

It is assumed that you have azure CLI and Terraform installed and configured.
More information on this topic [here](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure). I recommend using a Service Principal with a certificate.

### versions

This terraform script has been tested using the following versions:

- Terraform = 0.15.4
- Azure provider 2.60.0
- Azure CLI 2.24.0

## VM Authentication

Linux uses key based authentication and it assumes you already have a key and you can configure the path using the _devRHPublicKey_ variable in _`variablesDevRHVM.tf`_ You can create one using this command:

```ssh
ssh-keygen -t rsa -b 4096 -m PEM -C vm@mydomain.com -f ~/.ssh/vm_ssh
```

and set it using this approach:

```ssh
export TF_VAR_devRHPublicKey=`cat ~/.ssh/vm_ssh.pub`
```

Windows authentication uses user name and password. It is not recommended setting these values in terraform scripts. You can set them as Environment variables. More information about this approach can be found [here](https://www.terraform.io/docs/configuration/variables.html#environment-variables).
These are the recommended variables that you should set up using this approach:

```ssh
export TF_VAR_devWinUserName={{VMUSER}}
export TF_VAR_windowsPassword={{VMPASSWORD}}
```

You can also setup all these values as [secrets in GitHub Actions.](https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets)

## Usage

Just run these commands to initialize terraform, get a plan and approve it to apply it.

```ssh
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

I also recommend using a remote state instead of a local one. You can change this configuration in _`main.tf`_
You can create a free Terraform Cloud account [here](https://app.terraform.io).

## Clean resources

It will destroy everything that was created.

```ssh
terraform destroy --auto-approve
```

## Caution

Be aware that by running this script your account might get billed.

## Authors

- Marcelo Zambrana
