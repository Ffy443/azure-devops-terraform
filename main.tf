provider "azurerm" {
    version = "2.5.0"
    features {}
}

resource "azurerm_resource_group" "tf_test" {
    name = "tfmainrg"
    location = "Australia East"
}

resource "azurerm_container_group" "tfcg_test" {
    name = "weatherapi"
    location = azurerm_resource_group.tf_test.location
    resrouce_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "ffy443"
    os_type = "Linux"

    container {
        name = "weatherapi"
        image = "ffy443/weatherapi"
        cpu = "1"
        memory = "1"
        ports {
            port = 80
            protocol = "TCP"
        }
    }
}

