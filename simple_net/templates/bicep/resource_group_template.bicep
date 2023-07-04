param virtualMachines_app_vm_name string = 'app-vm'
param networkInterfaces_db_vm42_name string = 'db-vm42'
param publicIPAddresses_db_vm_ip_name string = 'db-vm-ip'
param networkInterfaces_app_vm782_name string = 'app-vm782'
param publicIPAddresses_app_vm_ip_name string = 'app-vm-ip'
param virtualMachines_postgress_vm_name string = 'postgress-vm'
param networkSecurityGroups_nsg_db_name string = 'nsg-db'
param networkSecurityGroups_nsg_web_name string = 'nsg-web'
param networkSecurityGroups_db_vm_nsg_name string = 'db-vm-nsg'
param networkInterfaces_postgress_vm591_name string = 'postgress-vm591'
param publicIPAddresses_postgress_vm_ip_name string = 'postgress-vm-ip'
param virtualNetworks_vnet_shared_westus_name string = 'vnet-shared-westus'

resource networkSecurityGroups_db_vm_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: networkSecurityGroups_db_vm_nsg_name
  location: 'westeurope'
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_nsg_db_name_resource 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: networkSecurityGroups_nsg_db_name
  location: 'westeurope'
  properties: {
    securityRules: [
      {
        name: 'AllowCidrBlockCustom5432Inbound'
        id: 'networkSecurityGroups_nsg_db_name_AllowCidrBlockCustom5432Inbound.id'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '5432'
          sourceAddressPrefix: '10.0.2.0'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowCidrBlockSSHInbound'
        id: 'networkSecurityGroups_nsg_db_name_AllowCidrBlockSSHInbound.id'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '137.116.210.35'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 140
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_nsg_web_name_resource 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: networkSecurityGroups_nsg_web_name
  location: 'westeurope'
  properties: {
    securityRules: [
      {
        name: 'AllowAnyCustomInbound'
        id: 'networkSecurityGroups_nsg_web_name_AllowAnyCustomInbound.id'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '8080'
            '80'
            '5000'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowMyIpAddressSSHInbound'
        id: 'networkSecurityGroups_nsg_web_name_AllowMyIpAddressSSHInbound.id'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '213.57.152.144'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'AllowMyIpAddressSSHmInbound'
        id: 'networkSecurityGroups_nsg_web_name_AllowMyIpAddressSSHmInbound.id'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '176.230.143.63'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 120
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource publicIPAddresses_app_vm_ip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_app_vm_ip_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '137.116.210.35'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource publicIPAddresses_db_vm_ip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_db_vm_ip_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '40.68.60.131'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource publicIPAddresses_postgress_vm_ip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_postgress_vm_ip_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '40.115.0.162'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource virtualMachines_app_vm_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_app_vm_name
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ms'
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: '20_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_app_vm_name}_OsDisk_1_6e8b0299c6d3425eae2d43b933d0ef76'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_app_vm_name}_OsDisk_1_6e8b0299c6d3425eae2d43b933d0ef76')
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_app_vm_name
      adminUsername: 'shachar'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: 'networkInterfaces_app_vm782_name_resource.id'
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource virtualMachines_postgress_vm_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_postgress_vm_name
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ms'
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: '20_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_postgress_vm_name}_OsDisk_1_4b2870a1f94c42658484eaa0a5097c1e'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_postgress_vm_name}_OsDisk_1_4b2870a1f94c42658484eaa0a5097c1e')
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_postgress_vm_name
      adminUsername: 'shachar'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    securityProfile: {
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
      securityType: 'TrustedLaunch'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: 'networkInterfaces_postgress_vm591_name_resource.id'
          properties: {
            deleteOption: 'Detach'
          }
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

resource networkSecurityGroups_nsg_web_name_AllowAnyCustomInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_nsg_web_name}/AllowAnyCustomInbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: [
      '8080'
      '80'
      '5000'
    ]
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_web_name_resource
  ]
}

resource networkSecurityGroups_nsg_db_name_AllowCidrBlockCustom5432Inbound 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_nsg_db_name}/AllowCidrBlockCustom5432Inbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '5432'
    sourceAddressPrefix: '10.0.2.0'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_db_name_resource
  ]
}

resource networkSecurityGroups_nsg_db_name_AllowCidrBlockSSHInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_nsg_db_name}/AllowCidrBlockSSHInbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '137.116.210.35'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 140
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_db_name_resource
  ]
}

resource networkSecurityGroups_nsg_web_name_AllowMyIpAddressSSHInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_nsg_web_name}/AllowMyIpAddressSSHInbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '213.57.152.144'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 110
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_web_name_resource
  ]
}

resource networkSecurityGroups_nsg_web_name_AllowMyIpAddressSSHmInbound 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_nsg_web_name}/AllowMyIpAddressSSHmInbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '176.230.143.63'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 120
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_nsg_web_name_resource
  ]
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

resource networkInterfaces_app_vm782_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_app_vm782_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${'networkInterfaces_app_vm782_name_resource.id'}/ipConfigurations/ipconfig1'
        etag: 'W/"d0436b75-51c6-497b-a1a2-4115308070f1"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.2.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            name: 'app-vm-ip'
            id: publicIPAddresses_app_vm_ip_name_resource.id
            properties: {
              provisioningState: 'Succeeded'
              resourceGuid: 'ecfefb71-fd07-43ec-a80e-3855cc9d15dd'
              publicIPAddressVersion: 'IPv4'
              publicIPAllocationMethod: 'Dynamic'
              idleTimeoutInMinutes: 4
              ipTags: []
              ipConfiguration: {
                id: '${'networkInterfaces_app_vm782_name_resource.id'}/ipConfigurations/ipconfig1'
              }
              deleteOption: 'Detach'
            }
            type: 'Microsoft.Network/publicIPAddresses'
            sku: {
              name: 'Basic'
              tier: 'Regional'
            }
          }
          subnet: {
            id: 'virtualNetworks_vnet_shared_westus_name_snet_web.id'
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    nicType: 'Standard'
  }
}

resource networkInterfaces_postgress_vm591_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_postgress_vm591_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${'networkInterfaces_postgress_vm591_name_resource.id'}/ipConfigurations/ipconfig1'
        etag: 'W/"9bf25958-d82f-4a7f-b7a6-4f8ab398f17a"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.1.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            name: 'postgress-vm-ip'
            id: publicIPAddresses_postgress_vm_ip_name_resource.id
            properties: {
              provisioningState: 'Succeeded'
              resourceGuid: 'a6cb2555-6263-42f7-84ed-cf0370effbf8'
              publicIPAddressVersion: 'IPv4'
              publicIPAllocationMethod: 'Dynamic'
              idleTimeoutInMinutes: 4
              ipTags: []
              ipConfiguration: {
                id: '${'networkInterfaces_postgress_vm591_name_resource.id'}/ipConfigurations/ipconfig1'
              }
              deleteOption: 'Detach'
            }
            type: 'Microsoft.Network/publicIPAddresses'
            sku: {
              name: 'Basic'
              tier: 'Regional'
            }
          }
          subnet: {
            id: 'virtualNetworks_vnet_shared_westus_name_snet_db.id'
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    nicType: 'Standard'
  }
}

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
            id: networkSecurityGroups_nsg_db_name_resource.id
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
            id: networkSecurityGroups_nsg_web_name_resource.id
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

resource virtualNetworks_vnet_shared_westus_name_snet_db 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${virtualNetworks_vnet_shared_westus_name}/snet-db'
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_db_name_resource.id
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
      id: networkSecurityGroups_nsg_web_name_resource.id
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

resource networkInterfaces_db_vm42_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_db_vm42_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${'networkInterfaces_db_vm42_name_resource.id'}/ipConfigurations/ipconfig1'
        etag: 'W/"12324e19-f8ba-42a1-bec6-22ede9e9966d"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.0.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            name: 'db-vm-ip'
            id: publicIPAddresses_db_vm_ip_name_resource.id
            properties: {
              provisioningState: 'Succeeded'
              resourceGuid: 'e4e29a12-a55b-4ca1-93b3-b9f888611634'
              publicIPAddressVersion: 'IPv4'
              publicIPAllocationMethod: 'Dynamic'
              idleTimeoutInMinutes: 4
              ipTags: []
              ipConfiguration: {
                id: '${'networkInterfaces_db_vm42_name_resource.id'}/ipConfigurations/ipconfig1'
              }
              deleteOption: 'Detach'
            }
            type: 'Microsoft.Network/publicIPAddresses'
            sku: {
              name: 'Basic'
              tier: 'Regional'
            }
          }
          subnet: {
            id: virtualNetworks_vnet_shared_westus_name_default.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_db_vm_nsg_name_resource.id
    }
    nicType: 'Standard'
  }
}
