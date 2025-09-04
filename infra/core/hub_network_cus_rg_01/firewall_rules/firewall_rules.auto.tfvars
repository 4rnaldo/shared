#########################################
######### Shared Resources ##############
#########################################
resource_group_name = "hub-network-eus-rg-01"
fw_policy_name      = "policy-hub-eus-afw-01"

###############################################################
######### Azure Firewall Network Rule Collection ##############
###############################################################

firewall_rule_group = {
  "Gatik_Core_Policy_Rules" = {
    priority = 100
    application_rule_collection = {
      "Allow_Core_Azure_Services" = {
        action   = "Allow"
        priority = 1000
        rules = {
          "Allow_Azure_FQDNs" = {
            protocols = {
              "Http" = {
                port = 80
              },
              "Https" = {
                port = 443
              },
            },
            source_addresses = ["10.96.0.0/16"]
            destination_fqdns = [
              "azure.microsoft.com",
              "go.microsoft.com",
              "graph.microsoft.com",
              "login.microsoftonline.com",
              "management.azure.com",
              "management.core.windows.net",
              "microsoft.com",
              "microsoftonline.com",
              "static2.sharepointonline.com",
              "visualstudio.com",
              "windows.net",
              "aadcdn.msauth.net",
              "amcdn.msftauth.net",
              "azurecomcdn.azureedge.net",
              "ml.azure.com",
              "*.azureml.ms",
              "*.azureml.net",
              "*.modelmanagement.azureml.net",
              "*.notebooks.azure.net",
              "*.file.core.windows.net",
              "*.dfs.core.windows.net",
              "*.blob.core.windows.net",
              "*.aznbcontent.net",
              "automlresources-prod.azureedge.net",
              "aka.ms",
              "8208854-SB1.connect.api.netsuite.com",
              "*.anaconda.com",
              "*.anaconda.org",
              "pypi.org",
              "*.pythonhosted.org",
              "pytorch.org",
              "*.pytorch.org",
              "*.tensorflow.org",
              "ghcr.io",
              "pkg-containers.githubusercontent.com",
              "*.kusto.windows.net",
              "*.table.core.windows.net",
              "*.queue.core.windows.net",
              "researchdeveusamlacr01.azurecr.io",
              "researchdeveusamlacr01.eastus.data.azurecr.io",
              "researchdeveusamlsa01.blob.core.windows.net",
              "f1ee9633-ca84-4d07-8881-284747e53d7d.workspace.eastus.api.azureml.ms",
              "eastus.experiments.azureml.net",
              "eastus.api.azureml.ms",
              "archive.ubuntu.com",
              "security.ubuntu.com",
              "ppa.launchpad.net",
              "*.vscode.dev",
              "*.vscode-unpkg.net",
              "*.vscode-cdn.net",
              "*.vscodeexperiments.azureedge.net",
              "default.exp-tas.com",
              "code.visualstudio.com",
              "update.code.visualstudio.com",
              "*.vo.msecnd.net",
              "marketplace.visualstudio.com",
              "vscode.blob.core.windows.net",
              "*.gallerycdn.vsassets.io",
              "github.com",
              "vscode.download.prss.microsoft.com",
              "NetSuite2.com",
              "*.batchai-eastus.svc"
            ],
          },
          "Allow_Azure_ML_Services" = {
                protocols = {
                  "Http" = {
                    port = 80
                  },
                  "Https" = {
                    port = 443
                  },
                },
                destination_fqdns = [
                  "*.vscode.dev",
                  "*.vscode-unpkg.net",
                  "*.vscode-cdn.net",
                  "*.vscodeexperiments.azureedge.net",
                  "default.exp-tas.com",
                  "code.visualstudio.com",
                  "update.code.visualstudio.com",
                  "*.vo.msecnd.net",
                  "marketplace.visualstudio.com",
                  "vscode.blob.core.windows.net",
                  "*.gallerycdn.vsassets.io",
                  "github.com",
                  "vscode.download.prss.microsoft.com",
                  "graph.windows.net",
                  "*.instances.azureml.net",
                  "*.instances.azureml.ms",
                  "eastus.tundra.azureml.ms",
                  "*.eastus.batch.azure.com",
                  "*.eastus.service.batch.azure.com",
                  "*.blob.core.windows.net",
                  "*.table.core.windows.net",
                  "*.queue.core.windows.net",
                  "researchdeveusamlsa01.file.core.windows.net",
                  "researchdeveusamlsa01.blob.core.windows.net",
                  "*.vault.azure.net",
                  "mcr.microsoft.com",
                  "*.data.mcr.microsoft.com",
                ]
                source_addresses = ["10.96.0.0/16"],      
          },
        },
      },
    },
    network_rule_collection = {
      "Allow_Outbound_Internet" = {
        action   = "Allow"
        priority = 600
        rules = {
          "Allow_All_to_Internet" = {
            protocols             = ["Any"]
            source_addresses      = ["10.100.0.0/16"]
            destination_addresses = ["*"]
            destination_ports     = ["443", "80", /*ML Ports*/ "8787", "18881", "5831", "445", "1708", "44224"]
          }
        }
      },
      "Allow_Internal_All" = {
        action   = "Allow"
        priority = 500
        rules = {
          "Allow_All_Internal_to_Internal" = {
            protocols             = ["Any"]
            source_addresses      = ["10.100.0.0/16"]
            destination_addresses = ["10.100.0.0/16"]
            destination_ports     = ["*"]
          }
        }
      },
      "Allow_Azure_All_Service_Tags" = {
        action   = "Allow"
        priority = 700
        rules = {
          "Allow_Azure_Service_Tags_Inbound" = {
            protocols             = ["Any"]
            source_addresses      = ["ActionGroup", "ApiManagement", "ApplicationInsightsAvailability", "AppServiceManagement", "AzureActiveDirectoryDomainServices", "AzureBotService", "AzureCloud", "AzureCognitiveSearch", "AzureConnectors", "AzureDatabricks", "AzureDataExplorerManagement", "AzureDeviceUpdate", "AzureDevOps", "AzureDigitalTwins", "AzureEventGrid", "AzureFrontDoor.Frontend", "AzureHealthcareAPIs", "AzureMachineLearningInference", "AzureSentinel", "AzureSphere", "AzureTrafficManager", "AzureWebPubSub", "BatchNodeManagement", "ChaosStudio", "CognitiveServicesFrontend", "CognitiveServicesManagement", "DataFactory", "Dynamics365ForMarketingEmail", "Dynamics365BusinessCentral", "EOPExternalPublishedIPs", "HDInsight", "LogicApps", "LogicAppsManagement", "M365ManagementActivityApiWebhook", "MicrosoftDefenderForEndpoint", "PowerBI", "PowerPlatformInfra", "PowerPlatformPlex", "PowerQueryOnline", "SerialConsole", "ServiceFabric", "SqlManagement", "StorageSyncService", "WindowsVirtualDesktop", "VideoIndexer"]
            destination_addresses = ["10.100.0.0/16"]
            destination_ports     = ["*"]
          },
          "Allow_Azure_Service_Tags_Outbound" = {
            protocols             = ["Any"]
            source_addresses      = ["10.100.0.0/16"]
            destination_addresses = ["AppConfiguration", "AppService", "AppServiceManagement", "AzureActiveDirectory", "AzureActiveDirectoryDomainServices", "AzureAdvancedThreatProtection", "AzureArcInfrastructure", "AzureAttestation", "AzureBackup", "AzureBotService", "AzureCloud", "AzureConnectors", "AzureContainerRegistry", "AzureCosmosDB", "AzureDatabricks", "AzureDeviceUpdate", "AzureEventGrid", "AzureFrontDoor.Frontend", "AzureHealthcareAPIs", "AzureInformationProtection", "AzureIoTHub", "AzureKeyVault", "AzureManagedGrafana", "AzureMonitor", "AzureOpenDatasets", "AzureResourceManager", "AzureSignalR", "AzureSiteRecovery", "AzureSphere", "AzureSpringCloud", "AzureStack", "AzureUpdateDelivery", "AzureWebPubSub", "BatchNodeManagement", "ChaosStudio", "CognitiveServicesFrontend", "CognitiveServicesManagement", "DataFactory", "DataFactoryManagement", "Dynamics365ForMarketingEmail", "Dynamics365BusinessCentral", "EOPExternalPublishedIPs", "EventHub", "GuestAndHybridManagement", "LogicApps", "M365ManagementActivityApi", "MicrosoftAzureFluidRelay", "MicrosoftCloudAppSecurity", "MicrosoftDefenderForEndpoint", "PowerBI", "PowerPlatformInfra", "PowerPlatformPlex", "PowerQueryOnline", "ServiceBus", "ServiceFabric", "Sql", "SqlManagement", "Storage", "StorageSyncService", "StorageMover", "WindowsAdminCenter", "WindowsVirtualDesktop", "VideoIndexer"]
            destination_ports     = ["*"]
          }
        }
      },
    } #End Networking Rules
  }   #End Gatik_Core_Policy_Rules
}