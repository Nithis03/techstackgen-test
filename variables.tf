variable "region" {
                      description = "The region where the resources will be deployed. This can correspond to the region of any cloud provider, such as AWS, Azure, Google Cloud, etc."
                      type        = string
                    }

                    variable "environment" {
                      description = "The environment (e.g., dev, prod)"
                      type        = string
                    }