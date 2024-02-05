module "aurora_postgresql_v2" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "v8.1.1"

  name              = "${local.db_name}"
  engine            = "aurora-postgresql"
  engine_mode       = "provisioned"
  engine_version    = local.postgres_version
  storage_encrypted = true
  master_username   = local.root_username

  vpc_id               = local.vpc_id
  db_subnet_group_name = local.db_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = local.private_subnet_cidr_blocks
    }
    vpn_ingress = {
      cidr_blocks = [local.vpn_cidr_block]
    }
  }

  monitoring_interval = local.monitoring_interval_seconds

  apply_immediately       = true
  backup_retention_period = local.backup_retention_period

  serverlessv2_scaling_configuration = {
    min_capacity = local.min_acu_capacity
    max_capacity = local.max_acu_capacity
  }

  instance_class = "db.serverless"
  instances = {
    one = {}
    two = {}
  }

  tags = {
    app_name = "${local.owning_team_name}"
  }
}