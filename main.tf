resource "google_storage_bucket" "website"{
  name = "example-website-bucket-bhavi"
  location = "asia-south2"
}
#making object publicly accessible
resource "google_storage_object_access_control" "public_access" {
  object = google_storage_bucket_object.website_index.name
  bucket = google_storage_bucket.website.name
  role   = "READER"
  entity = "allUsers"
}
#update index.html to bucket
resource "google_storage_bucket_object" "website_index" {
  name   = "index.html"
  bucket = google_storage_bucket.website.name
  source = "../website/index.html"
}
#reserving static external ip for lb
resource "google_compute_global_address" "website_ip" {
  name = "website-ip-lb"
}


/*resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
  zone         = "asia-south2-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}*/