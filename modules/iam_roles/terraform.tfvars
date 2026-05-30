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