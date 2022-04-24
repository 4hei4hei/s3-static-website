module "s3_static_website" {
  source           = "../../modules/s3_static_website/"
  region           = "hogehoge"
  host_zone_id     = "hogehogehogehoge"
  domain_name      = "hogehoge.hoge"
  domain_host_name = "hoge"
}
