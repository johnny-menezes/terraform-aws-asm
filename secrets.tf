
#######################################
## Criação do resource SecretManager ##
#######################################

resource "aws_secretsmanager_secret" "secret_demo" {
  name       = var.secret_name
  policy     = var.policy
  tags = {
    Environment = var.environment
    Provisioner = var.provisioner
    Repository  = var.repo
  }
}

resource "aws_secretsmanager_secret_version" "secret_demo" {
  secret_id     = aws_secretsmanager_secret.secret_demo.id
  secret_string = jsonencode(var.secret_values)

}