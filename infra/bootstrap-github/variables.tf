variable "repository_name" {
  description = "作成する GitHub リポジトリ名"
  type        = string
}

variable "visibility" {
  description = "GitHub リポジトリの公開範囲"
  type        = string
  default     = "public"

  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "visibility は public または private を指定してください。"
  }
}
