# s3-static-website

S3 を利用した静的 Web サイトホスティングを管理している

## Requirements

- tfenv (Terraform 1.0.4)

## Deployment

事前に独自ドメインを Route53 で登録している必要がある

事前にドメイン登録を行った状態で、

```
$ terraform apply
```

を各環境用のディレクトリ配下で以下コマンドを実行することで、登録したドメイン経由で静的サイトホスティングが有効な S3 がデプロイされる

## References

- https://docs.aws.amazon.com/ja_jp/AmazonS3/latest/userguide/website-hosting-custom-domain-walkthrough.html
