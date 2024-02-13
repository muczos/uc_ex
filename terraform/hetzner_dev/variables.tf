variable "hcloud_token" {
  type = string
}

variable "STAGE" {
  default = "dev"
}

variable "INT_NET_CIDR" {
  default = "10.16.0.0/16"
}

variable "INT_SUBNET" {
  default = "10.16.1.0/24"
}

variable "ACCCESS_KEYS" {
  type = map(string)
  default = {
    "muczos" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxkSCeAQasDLDIfqWEON/cJD8oTGRvgKRB9ksUQzcIgt6LD3UNxlPBYdiSl+xIUR1rM+n4+0S5R1BZpBqEP7lOc3gZTszdUL6ENY1PuiLSdyGAUvXZJvWSmpl0afDcfcm+l1SYrRxzej9hoeL2D3dCTiOVlJ90jeDWoWY6E88XpPs+4LmORvSxpW0I66+s+DqrTOpHkXQoqC7kqBiAiUnyKqb+RpFXH2VHnJrhUULR3rck7Pw5EkXFP2ZtsLOthsxHs+OgLGsGk3nXxfVMN4w17UPZSZUSJCeGyjr4KdmLac0otvolVXeuwLsvMaygi1AwTURevOl+05jTFQEMC+GTc5ornhgYDBiYdgJgmMLnVZxZqLpTKGcC1jHLP8w+YkfOjrBdRWJpp2nlm4skDX1cXiMxuejx8I9itzG6eTCXp3aez+arRBPXFFuZvSvRM8xT5/wfJnOsNF/TmUVGvrzbiErdQlhRagjjF2+wlfltfJ3SGQGuUGU0VR4oE4nx7gnuEa7dG93QPx4Nysg3EPxlC1ovwDQxLukRrxnI1BLivrSffw2GBUO1KJk/g+/6NZXDrzS3+daUQgbE96ICyR6X0K7Gb5WBmT5LlAFPAEulNSnMH6M+0gtwanenxvSCVg5WEUR/jaZXgNYCdvj74zbkUekCVKr7OA4l/4ja+p9UYw== muczos@lapidron"
  }  
}