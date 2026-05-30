variable "iam_roles" {

  description = "IAM roles configuration"

  type = map(object({

    role_name = string
    service   = string
    policies  = list(string)

  }))
}