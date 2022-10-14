terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }

  backend "s3" {
    bucket          = "infrati-tfstate-bucket" //S3 Bucket Name
    key             = "tf/terraform.tfstate"
    region          = "us-east-1"
    encrypt         = "true"
    dynamodb_table  = "infrati-tfstate-lock" //DynamoDB Table Name    
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}