param location string
param tags object = {}
param vnet object
param deploySSH bool = false

resource virtualNetworkResource 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: vnet.name
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet.addressPrefix
      ]
    }
    subnets: [
      {
        name: vnet.subnetName
        properties: {
          addressPrefix: vnet.subnetAddressPrefix
        }
      }
    ]
  }
}

resource networkSecurityGroupResource 'Microsoft.Network/networkSecurityGroups@2024-07-01' = {
  name: '${vnet.name}-nsg-01'
  location: location
}

resource sshSecurityRuleResource 'Microsoft.Network/networkSecurityGroups/securityRules@2024-07-01' = if (deploySSH) {
  parent: networkSecurityGroupResource
  name: 'SSH'
  properties: {
    priority: 1000
    protocol: 'Tcp'
    access: 'Allow'
    direction: 'Inbound'
    sourceAddressPrefix: '*'
    sourcePortRange: '*'
    destinationAddressPrefix: '*'
    destinationPortRange: '22'
  }
}

output subnetId string = virtualNetworkResource.properties.subnets[0].id
output networkSecurityGroupId string = networkSecurityGroupResource.id
