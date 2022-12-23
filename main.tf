resource "azurerm_resource_group" "qtrsg" {
  name = var.rsg_details.name
  location = var.rsg_details.location
}
resource "azurerm_kubernetes_cluster" "qtcluster" {
  name = "akscluster"
  resource_group_name = var.rsg_details.name
  location = var.rsg_details.location
  dns_prefix    = "aks1"
  default_node_pool {
    name = "aksnodes"
    node_count = 2
    vm_size       = "Standard_B2s"
    
   }
   identity {
    type = "SystemAssigned"
  } 
  depends_on = [
    azurerm_resource_group.qtrsg
  ]
}