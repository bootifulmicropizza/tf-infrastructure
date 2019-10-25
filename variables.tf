variable "default_tags" {
  default = {
    application = "bootifulmicropizza"
  }
}

variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "hosted_zone_name" {
  type = map

  default = {
    devops = "bootifulmicropizza.com"
    dev = "dev.bootifulmicropizza.com"
    prod = "prod.bootifulmicropizza.com"
  }
}

variable "hosted_zone_map" {
  type = map(map(object({
    name = string
    type = string
    ttl = number
    records = list(string)
  })))

  default = {
    devops2 = {}
    devops = {
      www = {
        name = "www.bootifulmicropizza.com"
        type = "CNAME"
        ttl = 300
        records = ["www.prod.bootifulmicropizza.com"]
      },
      api = {
        name = "api.bootifulmicropizza.com"
        type = "CNAME"
        ttl = 300
        records = ["api.prod.bootifulmicropizza.com"]
      }
    }
  }
}