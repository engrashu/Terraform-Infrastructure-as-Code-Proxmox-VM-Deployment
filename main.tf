terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.40.0"
    }
  }
}

variable "proxmox_api_token" {
  type      = string
  sensitive = true
}

provider "proxmox" {
  endpoint  = "https://192.168.224.17:8006/"
  api_token = var.proxmox_api_token
  insecure  = true

  ssh {
    agent    = false
  }
}

resource "proxmox_virtual_environment_vm" "student_vm" {
  count     = 1
  name      = "it316-user1-ubuntu"
  node_name = "22417-GEN8"

  description = "IT316 Student VM deployed via Terraform"
  tags        = ["it316", "terraform"]

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
  }

  clone {
    vm_id = 9000
    full  = true
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "virtio0"
    size         = 20
    file_format  = "raw"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  agent {
    enabled = true
  }

  boot_order = ["virtio0"]

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "student"
      password = "EnsignIT316P"
    }
  }
}

output "vm_id" {
  value = proxmox_virtual_environment_vm.student_vm[0].vm_id
}

output "vm_name" {
  value = proxmox_virtual_environment_vm.student_vm[0].name
}