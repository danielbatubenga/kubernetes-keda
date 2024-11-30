variable "cluster_name" {
  default = "eks-demo"
}

variable "region" {
  default = "us-east-1"
}

variable "kubernetes_version" {
  default = "1.24"
}

variable "desired_size" {
  default = 1
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 1
}