param galleries_MyImages_name string = 'MyImages'
param loadBalancers_applb_name string = 'applb'
param publicIPAddresses_lbip_name string = 'lbip'
param virtualMachines_postgress_vm_name string = 'postgress-vm'
param networkSecurityGroups_nsg_db_name string = 'nsg-db'
param networkSecurityGroups_nsg_web_name string = 'nsg-web'
param virtualMachines_vm_app_prod_001_name string = 'vm-app-prod-001'
param virtualMachines_vm_app_prod_002_name string = 'vm-app-prod-002'
param virtualMachines_vm_app_prod_003_name string = 'vm-app-prod-003'
param networkSecurityGroups_db_vm_nsg_name string = 'db-vm-nsg'
param publicIPAddresses_loadbalancerip_name string = 'loadbalancerip'
param virtualMachines_vm_jumpserver_dev_name string = 'vm-jumpserver-dev'
param networkInterfaces_postgress_vm591_name string = 'postgress-vm591'
param publicIPAddresses_postgress_vm_ip_name string = 'postgress-vm-ip'
param virtualNetworks_vnet_shared_westus_name string = 'vnet-shared-westus'
param networkInterfaces_vm_app_prod_001653_name string = 'vm-app-prod-001653'
param networkInterfaces_vm_app_prod_002238_name string = 'vm-app-prod-002238'
param networkInterfaces_vm_app_prod_003981_name string = 'vm-app-prod-003981'
param networkInterfaces_vm_jumpserver_dev840_name string = 'vm-jumpserver-dev840'
param publicIPAddresses_vm_jumpserver_dev_ip_name string = 'vm-jumpserver-dev-ip'
param virtualMachines_app_vm_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/rg-exchange/providers/Microsoft.Compute/virtualMachines/app-vm'

resource galleries_MyImages_name_resource 'Microsoft.Compute/galleries@2022-03-03' = {
  name: galleries_MyImages_name
  location: 'westeurope'
  properties: {
    identifier: {}
  }
}

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
        name: 'AllowCidrBlockSSHnbound'
        id: 'networkSecurityGroups_nsg_db_name_AllowCidrBlockSSHnbound.id'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '52.157.84.110'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 180
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'jumpserverconnection'
        id: 'networkSecurityGroups_nsg_db_name_jumpserverconnection.id'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '52.166.205.14'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 200
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

resource publicIPAddresses_lbip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_lbip_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '1'
    '2'
    '3'
  ]
  properties: {
    ipAddress: '20.33.6.74'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: [
      {
        ipTagType: 'RoutingPreference'
        tag: 'Internet'
      }
    ]
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource publicIPAddresses_loadbalancerip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_loadbalancerip_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '1'
    '2'
    '3'
  ]
  properties: {
    ipAddress: '20.33.6.121'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: [
      {
        ipTagType: 'RoutingPreference'
        tag: 'Internet'
      }
    ]
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
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

resource publicIPAddresses_vm_jumpserver_dev_ip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_vm_jumpserver_dev_ip_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '52.166.205.14'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
  }
}

resource galleries_MyImages_name_app_image 'Microsoft.Compute/galleries/images@2022-03-03' = {
  parent: galleries_MyImages_name_resource
  name: 'app-image'
  location: 'westeurope'
  properties: {
    hyperVGeneration: 'V2'
    architecture: 'x64'
    features: [
      {
        name: 'SecurityType'
        value: 'TrustedLaunch'
      }
      {
        name: 'DiskControllerTypes'
        value: 'SCSI'
      }
    ]
    osType: 'Linux'
    osState: 'Generalized'
    identifier: {
      publisher: 'canonical'
      offer: '0001-com-ubuntu-server-focal'
      sku: '20_04-lts-gen2'
    }
    recommended: {
      vCPUs: {
        min: 1
        max: 16
      }
      memory: {
        min: 1
        max: 32
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

resource networkInterfaces_vm_app_prod_001653_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_vm_app_prod_001653_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${'networkInterfaces_vm_app_prod_001653_name_resource.id'}/ipConfigurations/ipconfig1'
        etag: 'W/"110d327e-066a-4a5c-a3d6-3df9dd357490"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.2.10'
          privateIPAllocationMethod: 'Dynamic'
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

resource networkInterfaces_vm_app_prod_002238_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_vm_app_prod_002238_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${'networkInterfaces_vm_app_prod_002238_name_resource.id'}/ipConfigurations/ipconfig1'
        etag: 'W/"4b0466b1-d4ef-453f-bb0d-88f8b083fe20"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.2.11'
          privateIPAllocationMethod: 'Dynamic'
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

resource networkInterfaces_vm_app_prod_003981_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_vm_app_prod_003981_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${'networkInterfaces_vm_app_prod_003981_name_resource.id'}/ipConfigurations/ipconfig1'
        etag: 'W/"20d98ef0-e473-4a9a-9294-fb639a5561bd"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.2.8'
          privateIPAllocationMethod: 'Dynamic'
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

resource networkSecurityGroups_nsg_db_name_AllowCidrBlockSSHnbound 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_nsg_db_name}/AllowCidrBlockSSHnbound'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '52.157.84.110'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 180
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

resource networkSecurityGroups_nsg_db_name_jumpserverconnection 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_nsg_db_name}/jumpserverconnection'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '52.166.205.14'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 200
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

resource galleries_MyImages_name_app_image_0_0_1 'Microsoft.Compute/galleries/images/versions@2022-03-03' = {
  parent: galleries_MyImages_name_app_image
  name: '0.0.1'
  location: 'westeurope'
  properties: {
    publishingProfile: {
      targetRegions: [
        {
          name: 'West Europe'
          regionalReplicaCount: 1
          storageAccountType: 'Standard_LRS'
        }
      ]
      replicaCount: 1
      excludeFromLatest: false
      storageAccountType: 'Standard_LRS'
      replicationMode: 'Full'
    }
    storageProfile: {
      source: {
        id: virtualMachines_app_vm_externalid
      }
      osDiskImage: {
        hostCaching: 'ReadWrite'
        source: {}
      }
    }
    safetyProfile: {
      allowDeletionOfReplicatedLocations: true
    }
  }
  dependsOn: [

    galleries_MyImages_name_resource
  ]
}

resource virtualMachines_vm_app_prod_001_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_vm_app_prod_001_name
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ms'
    }
    storageProfile: {
      imageReference: {
        id: galleries_MyImages_name_app_image.id
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_vm_app_prod_001_name}_OsDisk_1_b6fde44f31e3414485386844d907b53f'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_vm_app_prod_001_name}_OsDisk_1_b6fde44f31e3414485386844d907b53f')
        }
        deleteOption: 'Detach'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_vm_app_prod_001_name
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
          id: networkInterfaces_vm_app_prod_001653_name_resource.id
          properties: {
            deleteOption: 'Delete'
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

resource virtualMachines_vm_app_prod_002_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_vm_app_prod_002_name
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ms'
    }
    storageProfile: {
      imageReference: {
        id: galleries_MyImages_name_app_image.id
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_vm_app_prod_002_name}_OsDisk_1_b7bf04f5b6da4975801daf72b9ba3031'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_vm_app_prod_002_name}_OsDisk_1_b7bf04f5b6da4975801daf72b9ba3031')
        }
        deleteOption: 'Detach'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_vm_app_prod_002_name
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
          id: networkInterfaces_vm_app_prod_002238_name_resource.id
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

resource virtualMachines_vm_app_prod_003_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_vm_app_prod_003_name
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ms'
    }
    storageProfile: {
      imageReference: {
        id: galleries_MyImages_name_app_image.id
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_vm_app_prod_003_name}_OsDisk_1_c046c50239824e6bbb949307f3cd8e61'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_vm_app_prod_003_name}_OsDisk_1_c046c50239824e6bbb949307f3cd8e61')
        }
        deleteOption: 'Detach'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_vm_app_prod_003_name
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
          id: networkInterfaces_vm_app_prod_003981_name_resource.id
          properties: {
            deleteOption: 'Delete'
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

resource virtualMachines_vm_jumpserver_dev_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_vm_jumpserver_dev_name
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ms'
    }
    storageProfile: {
      imageReference: {
        id: galleries_MyImages_name_app_image.id
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_vm_jumpserver_dev_name}_OsDisk_1_9cf5c1afe92840cf817a876f422dc14a'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_vm_jumpserver_dev_name}_OsDisk_1_9cf5c1afe92840cf817a876f422dc14a')
        }
        deleteOption: 'Detach'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_vm_jumpserver_dev_name
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
          id: 'networkInterfaces_vm_jumpserver_dev840_name_resource.id'
          properties: {
            deleteOption: 'Delete'
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

resource loadBalancers_applb_name_resource 'Microsoft.Network/loadBalancers@2022-11-01' = {
  name: loadBalancers_applb_name
  location: 'westeurope'
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: 'loadbalancepublicip'
        id: '${'loadBalancers_applb_name_resource.id'}/frontendIPConfigurations/loadbalancepublicip'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_loadbalancerip_name_resource.id
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'backends'
        id: 'loadBalancers_applb_name_backends.id'
        properties: {
          loadBalancerBackendAddresses: [
            {
              name: '76b05b03-05c7-4691-8751-f3c44618aacd'
              properties: {
                ipAddress: '10.0.2.10'
                virtualNetwork: {
                  id: 'virtualNetworks_vnet_shared_westus_name_resource.id'
                }
              }
            }
            {
              name: '0135173f-2448-4212-acb1-4710d198dd4d'
              properties: {
                ipAddress: '10.0.2.11'
                virtualNetwork: {
                  id: 'virtualNetworks_vnet_shared_westus_name_resource.id'
                }
              }
            }
            {
              name: '767914fc-882d-41aa-ae80-7f10b2e2a59d'
              properties: {
                ipAddress: '10.0.2.8'
                virtualNetwork: {
                  id: 'virtualNetworks_vnet_shared_westus_name_resource.id'
                }
              }
            }
          ]
        }
      }
    ]
    loadBalancingRules: [
      {
        name: 'loadbalancerrules'
        id: '${'loadBalancers_applb_name_resource.id'}/loadBalancingRules/loadbalancerrules'
        properties: {
          frontendIPConfiguration: {
            id: '${'loadBalancers_applb_name_resource.id'}/frontendIPConfigurations/loadbalancepublicip'
          }
          frontendPort: 80
          backendPort: 5000
          enableFloatingIP: false
          idleTimeoutInMinutes: 4
          protocol: 'Tcp'
          enableTcpReset: false
          loadDistribution: 'Default'
          disableOutboundSnat: true
          backendAddressPool: {
            id: 'loadBalancers_applb_name_backends.id'
          }
          backendAddressPools: [
            {
              id: 'loadBalancers_applb_name_backends.id'
            }
          ]
          probe: {
            id: '${'loadBalancers_applb_name_resource.id'}/probes/Health-Check'
          }
        }
      }
    ]
    probes: [
      {
        name: 'Health-Check'
        id: '${'loadBalancers_applb_name_resource.id'}/probes/Health-Check'
        properties: {
          protocol: 'Http'
          port: 80
          requestPath: '/'
          intervalInSeconds: 15
          numberOfProbes: 1
          probeThreshold: 1
        }
      }
    ]
    inboundNatRules: []
    outboundRules: []
    inboundNatPools: []
  }
}

resource loadBalancers_applb_name_backends 'Microsoft.Network/loadBalancers/backendAddressPools@2022-11-01' = {
  name: '${loadBalancers_applb_name}/backends'
  properties: {
    loadBalancerBackendAddresses: [
      {
        name: '76b05b03-05c7-4691-8751-f3c44618aacd'
        properties: {
          ipAddress: '10.0.2.10'
          virtualNetwork: {
            id: 'virtualNetworks_vnet_shared_westus_name_resource.id'
          }
        }
      }
      {
        name: '0135173f-2448-4212-acb1-4710d198dd4d'
        properties: {
          ipAddress: '10.0.2.11'
          virtualNetwork: {
            id: 'virtualNetworks_vnet_shared_westus_name_resource.id'
          }
        }
      }
      {
        name: '767914fc-882d-41aa-ae80-7f10b2e2a59d'
        properties: {
          ipAddress: '10.0.2.8'
          virtualNetwork: {
            id: 'virtualNetworks_vnet_shared_westus_name_resource.id'
          }
        }
      }
    ]
  }
  dependsOn: [
    loadBalancers_applb_name_resource

  ]
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
        etag: 'W/"b4659187-d7de-429c-b304-cdd160a51044"'
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
              resourceGuid: 'dff9231c-d405-4dc5-9678-19165e2a5f65'
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

resource networkInterfaces_vm_jumpserver_dev840_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_vm_jumpserver_dev840_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        id: '${'networkInterfaces_vm_jumpserver_dev840_name_resource.id'}/ipConfigurations/ipconfig1'
        etag: 'W/"a27b2d19-69c4-4a15-970a-39d433517976"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.0.2.12'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            name: 'vm-jumpserver-dev-ip'
            id: publicIPAddresses_vm_jumpserver_dev_ip_name_resource.id
            properties: {
              provisioningState: 'Succeeded'
              resourceGuid: '2303857f-da9e-47ba-b599-b5300e09a2d8'
              publicIPAddressVersion: 'IPv4'
              publicIPAllocationMethod: 'Dynamic'
              idleTimeoutInMinutes: 4
              ipTags: []
              ipConfiguration: {
                id: '${'networkInterfaces_vm_jumpserver_dev840_name_resource.id'}/ipConfigurations/ipconfig1'
              }
              deleteOption: 'Delete'
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
