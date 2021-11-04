# Kitchen EC2 Extensive

This repository describes Test Kitchen plugins for testing Terraform configuration. 

It is based on this [Extensive Kitchen-Terraform Tutorial](https://newcontext-oss.github.io/kitchen-terraform/tutorials/extensive_kitchen_terraform.html) 

This repository shows you the following
1. Create multiple environments with the same terraform files by using workspaces
2. Use Kitchen-Terraform to test the multiple created servers for different properties


# Prerequisites

Vagrant [See documentation](https://www.vagrantup.com/docs/installation)  
Virtualbox [See documentation](https://www.virtualbox.org/wiki/Downloads)

# How to

## Use the Test Kitchen plugin
1. Clone the repository to your local machine
```
git clone https://github.com/munnep/kitchen_extensive.git
```
2. Go to the directory
```
cd kitchen_extensive
```
3. Start a virtual machine with Vagrant
```
vagrant up
```
4. ssh into the virtual machine with Vagrant.
```
vagrant ssh
```
5. Go to the ```/vagrant``` directory
```
cd /vagrant
```
6. Set your AWS credentials
```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
```
7. Set the region in which we want to create Centos environment. This has to be us-east-1
```
export AWS_DEFAULT_REGION=us-east-1
```
8. create the terraform workspace with kitchen for CentOS
```
bundle exec kitchen create centos
```
9. Create the Terraform environment for CentOS
```
bundle exec kitchen converge centos
```
10. Verify if the created environment is created (wait a few minutes after the creation)
```
bundle exec kitchen verify centos
```
11. Should see output like this
```
Profile: Extensive Kitchen-Terraform (extensive_suite)
Version: 0.1.0
Target:  ssh://centos@ec2-3-235-49-63.compute-1.amazonaws.com:22

  ✔  operating_system: centos
     ✔  centos is expected to eq "centos"
  ✔  reachable_other_host: Host 44.197.170.141

     ✔  Host 44.197.170.141
      is expected to be reachable


Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary: 2 successful, 0 failures, 0 skipped
```
12. Destroy the CentOS environment
```
bundle exec kitchen destroy centos
```
13. You are going to create an Ubuntu environment in a different AWS region. This has to be us-west-1
```
export AWS_DEFAULT_REGION=us-west-1
```
14. create the terraform workspace with kitchen voor Ubuntu
```
bundle exec kitchen create ubuntu
```
15. Create the Terraform environment for CentOS
```
bundle exec kitchen converge ubuntu
```
16. Verify if the created environment is created (wait a few minutes after the creation)
```
bundle exec kitchen verify ubuntu
```
17. Should see output like this
```
Profile: Extensive Kitchen-Terraform (extensive_suite)
Version: 0.1.0
Target:  ssh://ubuntu@ec2-54-176-163-217.us-west-1.compute.amazonaws.com:22

  ✔  operating_system: ubuntu
     ✔  ubuntu is expected to eq "ubuntu"
  ✔  reachable_other_host: Host 18.144.30.162

     ✔  Host 18.144.30.162
      is expected to be reachable


Profile Summary: 2 successful controls, 0 control failures, 0 controls skipped
Test Summary: 2 successful, 0 failures, 0 skipped
$$$$$$ Finished verifying the 'remote' system.
$$$$$$ Finished verifying the systems.
       Finished verifying <extensive-suite-ubuntu> (0m13.90s).
-----> Test Kitchen is finished. (0m14.39s)
```
18. Destroy the ubuntu environment
```
bundle exec kitchen destroy ubuntu
```
19. exit out of the vagrant machine
```
exit
```
20. Stop the vagrant machine
```
vagrant halt
```
21. When you are completely done you can remove it
```
vagrant destroy
```
