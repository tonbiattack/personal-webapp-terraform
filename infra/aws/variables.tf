variable "project_name" {
  description = "リソース名に使うプロジェクト識別子"
  type        = string
}

variable "environment" {
  description = "環境名。state は環境ごとに分離する"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "デプロイ先リージョン"
  type        = string
  default     = "ap-northeast-1"
}
