#########################################
######### Shared Resources ##############
#########################################

resource_group_name = "hub-network-eus-rg-01" #(Required)
location            = "EastUS" #(Required)

#########################################

#########################################
########### Virtual Network Values ######
#########################################

virtual_network_name = "hub-eus-vnet-01" #(Required)
vnet_address_space   = ["10.100.0.0/21"] #(Required)
# dns_servers = "" # Waiting on Firewall Deployment, hub should leverage the azure default.

#########################################

tags = { # TODO - UPDATE
  Owner           = "Avaneesh Arora"
  Environment     = "Prod"
  CreatedBy       = "Terraform"
  Location        = "EastUS"
  CostCenter      = "Main"
  Criticality     = "High"
  ApplicationName = "Shared"
  CreatedDate     = "09-18-2024"
  TFManaged       = "True"
  OpsTeam         = "IT"
}
