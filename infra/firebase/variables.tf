variable "google_project_id" {
  description = "あらかじめ作成した Google Cloud プロジェクト ID"
  type        = string
}

variable "firestore_location" {
  description = "Firestore のロケーション。一度作成すると変更できない"
  type        = string
  default     = "asia-northeast1"
}
