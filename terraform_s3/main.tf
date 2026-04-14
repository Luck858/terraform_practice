provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "abc-bucket" {
    name = "abc-bucket-2026"
    
}