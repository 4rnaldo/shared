
#########################################
######### Shared Resources ##############
#########################################
resource_group_name               = "hub-network-eus-rg-01"
location                          = "eastus"
enable_resource_group_delete_lock = true

tags = { # TODO - UPDATE
  Owner           = "Avaneesh Arora"
  Environment     = "Prod"
  CreatedBy       = "Terraform"
  Location        = "EastUS"
  CostCenter      = "Main"
  Criticality     = "High"
  ApplicationName = "Shared"
  CreatedDate     = "09-17-2024"
  TFManaged       = "True"
  OpsTeam         = "IT"
}

