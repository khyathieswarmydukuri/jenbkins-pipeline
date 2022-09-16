resource "aws_s3_bucket" "vnky-ngr-bucket" {
  bucket = "rct-vnyk-nagar"

  tags = {
    Name        = "vnky-ngr-bucket"
  }
}