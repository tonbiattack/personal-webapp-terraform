# Firebase Terraform

ログインとリアルタイム更新を早く提供したい場合の構成です。既存の Google Cloud プロジェクトを Firebase に有効化し、Firestore Native データベースを作成します。

Firebase の有効化と Firestore のロケーションは後から簡単に戻せません。`terraform destroy` で Firebase を無効化しないよう、`prevent_destroy` を設定しています。Firestore には削除保護を設定しています。

## 手順

Google Cloud CLI で対象プロジェクトへログインしてから実行します。

```powershell
gcloud auth application-default login
terraform init
terraform plan -var 'google_project_id=<Project ID>'
terraform apply -var 'google_project_id=<Project ID>'
```

## 運用上の注意

Spark プランは Firestore、Hosting、Authentication に無料枠がありますが、上限を超えたサービスは月末まで停止する場合があります。Blaze に移行した場合、Firebase は利用額の上限を設定できないため、Google Cloud の予算アラートを作成して監視します。
