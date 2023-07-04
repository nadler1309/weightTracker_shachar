param virtualNetworks_vnet_shared_westus_name string = 'vnet-shared-westus'
param networkSecurityGroups_nsg_db_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/rg-exchange/providers/Microsoft.Network/networkSecurityGroups/nsg-db'
param networkSecurityGroups_nsg_web_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/rg-exchange/providers/Microsoft.Network/networkSecurityGroups/nsg-web'

resource virtualNetworks_vnet_shared_westus_name_resource 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: virtualNetworks_vnet_shared_westus_name
  location: 'westeurope'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        id: 'virtualNetworks_vnet_shared_westus_name_default.id'
        properties: {
          addressPrefix: '10.0.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-db'
        id: 'virtualNetworks_vnet_shared_westus_name_snet_db.id'
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_db_externalid
          }
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-web'
        id: 'virtualNetworks_vnet_shared_westus_name_snet_web.id'
        properties: {
          addressPrefix: '10.0.2.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_web_externalid
          }
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_vnet_shared_westus_name_default 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${virtualNetworks_vnet_shared_westus_name}/default'
  properties: {
    addressPrefix: '10.0.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_shared_westus_name_resource
  ]
}

resource virtualNetworks_vnet_shared_westus_name_snet_db 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${virtualNetworks_vnet_shared_westus_name}/snet-db'
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_db_externalid
    }
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_shared_westus_name_resource
  ]
}

resource virtualNetworks_vnet_shared_westus_name_snet_web 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${virtualNetworks_vnet_shared_westus_name}/snet-web'
  properties: {
    addressPrefix: '10.0.2.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_web_externalid
    }
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_shared_westus_name_resource
  ]
}
