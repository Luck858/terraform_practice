terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Best practice: Lock your version
    }
  }
  backend "s3" {
    bucket = "tf-exmp" # Replace with your bucket name
    key    = "tf-backend/terraform.tfstate"
    region = "ap-south-1" # Replace with your region
  }

}
