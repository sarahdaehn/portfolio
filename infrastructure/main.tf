terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}
# Create a new container registry
resource "digitalocean_container_registry" "foobar" {
  name                   = "portfoliosarah"
  subscription_tier_slug = "starter"
}


resource "digitalocean_kubernetes_cluster" "foo" {
  name   = "foo"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
#   version = "1.22.8-do.1"
#   version = "1.16.13-do.0"
  version = "1.27.2-do.0"
  registry_integration = true

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb" 
    node_count = 2


    # taint {
    #   key    = "workloadKind"
    #   value  = "database"
    #   effect = "NoSchedule"
    # }
  }
}