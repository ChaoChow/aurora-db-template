terraform {
  backend "s3" {
    bucket         = "{{cookiecutter.state_s3_bucket_name}}"
    key            = "{{cookiecutter.lock_dynamo_key_prefix}}{{cookiecutter.db_name}}"
    region         = "{{cookiecutter.aws_region}}"
    dynamodb_table = "{{cookiecutter.lock_dynamo_table_name}}"
    encrypt        = true
  }
}

provider "aws" {
  region = "{{cookiecutter.aws_region}}"
}
