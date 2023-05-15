#terraform {
 # backend "s3" {
  #  encrypt        = true
   # bucket         = "terraform-state-mrodriguez"
    #dynamodb_table = "terraform-lock-table"
    #key            = "terraform.tfstate"
    #region         = "us-east-1"
 # }
#}
# Posteriormente a crear el backend se crea el bucket s3 con el mismo nombre que el declarado y la tabla dynamo con el nombre LockID
# Luego de configurado el backend debo hacer un terraform init
