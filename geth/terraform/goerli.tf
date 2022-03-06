provider "google" {
    credentials = "${file("credentials.json")}"
    project     = "542264036102"
}

resource "google_compute_instance" "GoerliConsole" {
  name = "goerli-343204"
  zone = "us-east1-b"
  machine_type = "n1-standard-1"
  min_cpu_platform = "Intel Skylake"
  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
        image = "ubuntu-1804-lts"
        type = "pd-standard"
        size = "40"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  metadata_startup_script = "sudo apt update -y && sudo apt upgrade -y && sudo apt-get install software-properties-common -y && sudo add-apt-repository ppa:ethereum/ethereum -y && sudo apt update -y && sudo apt install ethereum -y && sudo curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh && sudo apt install -y nodejs"
}