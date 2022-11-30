# Terraform, Ansible and WordPress on EC2 Ubuntu

## Prerequisite

### Github preparation
1. On you local machine create a directory for your WordPress site: 
```bash
mkdir wordpress && git clone https://github.com/WordPress/WordPress
```
2. Next remove `https://github.com/WordPress/WordPress.git` as the origin:
```bash
git remote rm origin
```
3. Next change Master branch to Main: 
```bash
git branch -m master main
```

4. Now go to Github and create a private repository and follow commands to "…or push an existing repository from the command line". 

5. Once you have pushed your local WordPress to the private repo, go back to Github and click your profile photo in the top right corner and select **settings > Developer settings > Personal access tokens > Fined-grained Tokens > Generate new token**. 
 - On the "New fine-grained personal access token Beta" screen select "Only select repositories" and select your private WordPress repo. 
 - For permissions select "Contents -  Repository contents, commits, branches, downloads, releases, and merges." and select "Read-only" from the selection dropdown. 
 - On the next screen copy your created token in a safe place and add it to `prod.tfvars`.

### AWS preparation
6. Have a domain ready to use
Go to EC2 and navigate to "Elastic IPs" and click "Allocate Elastic IP address" and make note of the AllocatedIPv4 address.
    Next go to Route 53 and navigate to "Hosted zones" then click "Create hosted zone". After creating the zone add an 'A' record that points to the EIP Address  ex: '54.200.80.70'. The last step is to go to your domain registar/DNS provider and create an 'A' record that also points to the EIP address.

    Now we are going to configure our prod.tfvars. First add your a unique DB password that will be used for the RDS instance. Next add the allocation_id from the EIP. 

ssh -i ~/.ssh/devops_rsa ubuntu@54.177.171.4
    To log into VM 
    `ssh -i ~/.ssh/devops_rsa ubuntu@54.176.168.110`


We are now ready to let things rip. 
First run `terraform init` and lets test things out with a `terraform plan -var-file="prod.tfvars"`
