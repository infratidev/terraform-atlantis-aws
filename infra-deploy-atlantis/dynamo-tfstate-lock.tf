################################################
#Create DynamoDB Table
################################################

resource "aws_dynamodb_table" "tf-state-lock" {
    name           = "infrati-tfstate-lock"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
    Name        = "terraform-infrati-tfstate"
    Environment = "Development"        
    }
}
