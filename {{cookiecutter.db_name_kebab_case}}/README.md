# {{cookiecutter.db_name_kebab_case}}

This template is not fully ready once you create it via cookiecutter. Please follow the below steps to fully complete setting up your project.

1. Open terraform/locals.tf
2. Fill out the following values 
   3. vpc_id - VPC ID where you will deploy this RDS
   4. db_subnet_group_name - unique name for the subnet group where this RDS will be deployed. Typically this subnet group is locked down with VPN required for access.
   5. private_subnet_cidr_blocks - list of cidr blocks where this RDS and its backups will be deployed. Min 3 subnets.
   6. vpn_cidr_block - CIDR block for the VPN used to connect to the DB from outside of the VPC.
2. In terminal, navigate into the terraform directory then run `terraform apply`. This should deploy your Aurora RDS to AWS.
2. In config/flyway/prod/flyway.conf change the flyway.url to match your deployed RDS url. you can find your deployed RDS url in the AWS web console.[db_setup.sql](db_setup.sql)