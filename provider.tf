#testing out adding tags to bg dataset
provider "google" {
  project = var.gcp_project_id
  region = var.gcp_region
  credentials = file(var.gcp_svc_key)
}
terraform{
  required_providers{
    google = {
      source = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}


#Below are practice material
/*provider "google" {
  credentials = file(var.gcp_svc_key)
  project    = var.gcp_project_id
  region     = var.gcp_region
}

terraform {
  required_version = ">1.4.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.50.0"
    }
  }
}

provider "google" {
  project = "gleaming-nomad-474505-r3"
  region  = "asia-south2"
}*/