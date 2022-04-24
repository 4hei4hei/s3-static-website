module "s3_static_website" {
  source           = "../../modules/s3_static_website/"
  region           = "fugafuga"
  host_zone_id     = "fugafugafugafuga"
  domain_name      = "fugafuga.fuga"
  domain_host_name = "fuga"
}
