locals {
  db_name                   = "{{ cookiecutter.db_name_kebab_case }}"
  owning_team_name          = "{{ cookiecutter.owning_team_name }}"
  region                     = "{{ cookiecutter.aws_region }}"
  vpc_id                     = ""
  db_subnet_group_name       = ""
  private_subnet_cidr_blocks = []
  postgres_version = "{{ cookiecutter.postgres_version }}"
  root_username = "{{ cookiecutter.root_user_name}}"
  vpn_cidr_block = ""
  monitoring_interval_seconds = "{{ cookiecutter.monitoring_interval_seconds }}"
  backup_retention_period = "{{ cookiecutter.backup_retention_period }}"
  min_acu_capacity = "{{ cookiecutter.min_acu_capacity }}"
  max_acu_capacity = "{{ cookiecutter.max_acu_capacity }}"
}