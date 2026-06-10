# Terraform Infrastructure as Code: Proxmox VM Deployment

![Terraform](https://img.shields.io/badge/Terraform-v1.15.5-7B42BC?logo=terraform)
![Proxmox](https://img.shields.io/badge/Proxmox-9.1.5-E57000?logo=proxmox)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Course](https://img.shields.io/badge/Course-IT316-blue)

## Overview

This project demonstrates the use of **Terraform** as an Infrastructure as Code (IaC) tool 
to automate the deployment of an Ubuntu virtual machine on a **Proxmox VE 9.1.5** 
hypervisor in a TechLabs academic environment.

The deployment was completed as part of IT316 – Cybersecurity Operations, Week 6, 
covering the use of IaC tools in security and red team operations.

---

## What Was Built

- Ubuntu VM (`it316-user1-ubuntu`) deployed remotely on Proxmox node `22417-GEN8`
- VM ID: 112 | 2 vCPUs | 2GB RAM | 20GB disk | DHCP networking
- Full clone from base Ubuntu template (VM ID 9000)
- Cloud-init initialization with user account provisioning
- API token authentication — secret injected via environment variable, never hardcoded
- Deployed over school VPN to a private lab network

---

## Tools & Technologies

| Tool | Version | Purpose |
|------|---------|---------|
| Terraform | v1.15.5 | Infrastructure as Code |
| bpg/proxmox provider | v0.109.0 | Proxmox API integration |
| Proxmox VE | 9.1.5 | Hypervisor / virtualization platform |
| Windows CMD | - | Local execution environment |
| School VPN | - | Secure access to private lab network |

---

## Project Structure

Terraform-proxmox/
├── main.tf                  # Terraform configuration
├── terraform_output.txt     # Console output from successful apply
├── screenshots/
│   ├── 01_terraform_init.png
│   ├── 02_terraform_plan.png
│   ├── 03_terraform_apply.png
│   └── 04_proxmox_vm_running.png
└── README.md
