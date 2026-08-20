provider "cloudflare" {}

locals {
  database_name = "${var.project_name}-${var.environment}"
}

resource "cloudflare_d1_database" "application" {
  account_id            = var.cloudflare_account_id
  name                  = local.database_name
  primary_location_hint = "enam"
}

output "d1_database_id" {
  description = "Worker の DB binding に設定する D1 データベース ID"
  value       = cloudflare_d1_database.application.id
}
