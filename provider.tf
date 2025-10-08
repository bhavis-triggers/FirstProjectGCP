terraform{
    required_version=">1.4.0"
    required_provider{
        google = {
            source"hashicorp/google"
            version="~>4.50.0"
        }
    }
}
provider "google"{
    project="FirstProjectGCP2"
    region="us-central1"
}