provider "azurerm" {
 
   version = "~>2.0"

    subscription_id="8f14efb9-d2f2-4ef8-aeb8-afe76bf837bc"
    tenant_id="2350759d-5605-44a5-b4ba-76c6ac205e2b"
    client_id="e2b9449b-d20c-419c-a031-1879af34e499"
  features {
  }
}
# Create a resource group


resource "azurerm_resource_group" "RS1" {
  name     = "Firstresource"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "Vnet1" {
  name                = "Firstvnet1"
  resource_group_name = azurerm_resource_group.RS1.name
  location            = azurerm_resource_group.RS1.location
  address_space       = ["10.0.0.0/16"]
}


# Create a subnet under Vnet 
resource "azurerm_subnet" "Subnet1" {
  name                 = "Firstsubnet1"
  resource_group_name  = azurerm_resource_group.RS1.name
  virtual_network_name = azurerm_virtual_network.Vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}

