# sub-gatik-connectivity-01

## Overview
This repository contains the **infrastructure-as-code (IaC)** configuration for the **Gatik Connectivity environment**. It is responsible for provisioning and managing the **core connectivity infrastructure** that supports communication and secure networking across Gatik’s environments, including development, staging, and production workloads.

The configuration leverages **Terraform** for declarative deployments and integrates with CI/CD pipelines for automated and consistent updates.

Key components include:
- **Hub and spoke network topology** to standardize secure communication across environments.
- **Bastion hosts** for secure remote access to internal systems.
- **Private DNS zones and resolvers** to ensure reliable internal name resolution.
- **Tailscale subnet routers** for flexible and secure remote connectivity to internal networks.

This setup ensures a **secure, scalable, and high-performance connectivity foundation**, supporting both on-premise and cloud-native workflows.

## Project Structure
```
sub-gatik-connectivity-01/
├── infra/                                      # Infrastructure code
│   └── core/                                    # Core modules for connectivity
│       ├── bastion_eus_rg_01/                   # Bastion host configuration
│       ├── hub_network_eus_rg_01/               # Hub network configuration
│       ├── prvdns_hub_eus_rg_01/                # Private DNS resolver and zones
│       ├── tailscale_subnetrouter_eus_rg_01/    # Tailscale subnet router (East US)
│       └── tailscale_subnetrouter_wus_rg_01/    # Tailscale subnet router (West US)
├── .gitignore                                   # Git ignore rules
├── .gitlab-ci.yml                               # CI/CD pipeline configuration
└── README.md                                    # Documentation
```

## Getting Started
```bash
git clone https://your-repo-url.git
cd sub-gatik-connectivity-01/infra/core
terraform init
terraform apply
```

## Notes
- Ensure proper access to the required subscriptions and resource groups before applying configurations.
- Networking changes should be reviewed carefully to avoid downtime or conflicts in connected environments.
- Refer to module-specific documentation in each folder under `infra/core` for detailed configurations and variables.
