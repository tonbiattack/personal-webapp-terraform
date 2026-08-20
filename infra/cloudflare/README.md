# Cloudflare Terraform

Cloudflare のアカウント資源だけを Terraform で管理します。Worker のコードと静的アセットは、`apps/worker` から Wrangler でデプロイします。

API トークンはファイルに書かず、次のように環境変数で渡します。

```powershell
$env:CLOUDFLARE_API_TOKEN = '<API Token>'
terraform init
terraform plan -var 'cloudflare_account_id=<Account ID>' -var 'project_name=personal-webapp'
```

`d1_database_id` を `apps/worker/wrangler.d1.example.jsonc` の `database_id` へ設定してから、D1 binding を有効にします。
