Ansible Playbooks
-----------------

Ansible scripts for maintaining the fleet. Ansible runs in python. You will need a copy of python, any should do. Then run 

`pip install ansible`
`pip install boto`

and you should have the requisite tools to get going. There is a pip `requirements.txt` file for fast setup. In addition, you will need to create AWS 
environment variables in order to work with AWS. Specifically, you need:

```export AWS_ACCESS_KEY_ID=xxxx```

```export AWS_SECRET_ACCESS_KEY=xxxx``` 

defined in your env.

There are a few things in general that we can accomplish with these playbooks:

1. Provision and launch a set of EC2 instances -- with associated security groups and rules
2. Download and install the applications and environments we need:
	- Python environment and necessary libraries
	- Apache Kafka
	- SBT and scala
	- Apache Spark
3. Tear down

Getting Started 
---------------
To get started, we followed the steps outlined here: https://aws.amazon.com/blogs/apn/getting-started-with-ansible-and-dynamic-amazon-ec2-inventory-management/

including downloading and marking for execution the ec2.py script. 

launchEc2.yml
--------------
This is our first playbook, really designed for just getting the bare metal up and running on Amazon.
