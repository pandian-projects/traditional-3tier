vpc_name       = "tf-demo"
managed_by     = "terraform-v2"
region         = "us-east-1"
vpc_cidr       = "10.0.0.0/16"
subnet_cidr    = "10.0.1.0/24"
instance_type  = "t2.micro"
ami            = "ami-098e39bafa7e7303d" # Amazon Linux
key_name       = "linux-04-26"
my_ip          = "49.43.248.89/32"
sns_topic_name = "tf_drift_detect"
sns_protocol   = "email"
endpoint       = "j.pandian04@gmail.com"
iam_roles = {

  role_a = {
    role_name = "lambda_custom_role"

    service = "lambda.amazonaws.com"

    policies = [
      "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    ]
  }

  role_b = {
    role_name = "ec2_custom_role"

    service = "ec2.amazonaws.com"

    policies = [
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
      "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
    ]
  }

  role_c = {
    role_name = "eventbridge_custom_role"

    service = "events.amazonaws.com"

    policies = [
      "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
      "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
    ]
  }

  role_d = {
    role_name = "ecs_custom_role"

    service = "ecs-tasks.amazonaws.com"

    policies = [
      "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
      "arn:aws:iam::aws:policy/AWSKeyManagementServicePowerUser"
    ]
  }
}