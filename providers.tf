terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-1"
  // Probably should rm if on you Mac/Windows machine and replace with location of aws config file.
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
}