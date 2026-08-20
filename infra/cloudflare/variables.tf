variable "cloudflare_account_id" {
  description = "Cloudflare のアカウント ID。トークンは CLOUDFLARE_API_TOKEN で渡す"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "D1 データベース名に使うプロジェクト識別子"
  type        = string
}

variable "environment" {
  description = "環境名。開発と本番では state を分ける"
  type        = string
  default     = "dev"
}
