resource "aws_s3_bucket" "s3_static_web" {
  bucket        = "${var.domain_host_name}.${var.domain_name}"
  acl           = "public-read"
  request_payer = "BucketOwner"
  force_destroy = true

  versioning {
    enabled    = true
    mfa_delete = false
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  logging {
    target_bucket = "hogehogehoge"
    target_prefix = "hoge/hoge/hoge/"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_static_web" {
  bucket                  = aws_s3_bucket.s3_static_web.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  depends_on = [
    aws_s3_bucket_policy.s3_static_web
  ]
}

resource "aws_s3_bucket_policy" "s3_static_web" {
  bucket = aws_s3_bucket.s3_static_web.id
  policy = data.aws_iam_policy_document.s3_static_web.json
}

data "aws_iam_policy_document" "s3_static_web" {
  statement {
    sid    = "AllowGetObject"
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    resources = [
      "${aws_s3_bucket.s3_static_web.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_object" "s3_object_static_web_index" {
  bucket       = aws_s3_bucket.s3_static_web.id
  key          = "index.html"
  source       = "../../../assets/index.html"
  content_type = "text/html"
  etag         = filemd5("../../../assets/index.html")
}

resource "aws_s3_bucket_object" "s3_object_static_web_error_page" {
  bucket       = aws_s3_bucket.s3_static_web.id
  key          = "error.html"
  source       = "../../../assets/error.html"
  content_type = "text/html"
  etag         = filemd5("../../../assets/error.html")
}

resource "aws_route53_record" "s3_static_web" {
  zone_id = var.host_zone_id
  name    = "${var.domain_host_name}.${var.domain_name}"
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = "s3-website-${var.region}.amazonaws.com"
    zone_id                = aws_s3_bucket.s3_static_web.hosted_zone_id
  }
}
