param virtualMachines_postgress_vm_name string = 'postgress-vm'
param disks_postgress_vm_OsDisk_1_4b2870a1f94c42658484eaa0a5097c1e_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/RG-EXCHANGE/providers/Microsoft.Compute/disks/postgress-vm_OsDisk_1_4b2870a1f94c42658484eaa0a5097c1e'
param networkInterfaces_postgress_vm591_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/rg-exchange/providers/Microsoft.Network/networkInterfaces/postgress-vm591'

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
          id: disks_postgress_vm_OsDisk_1_4b2870a1f94c42658484eaa0a5097c1e_externalid
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
          id: networkInterfaces_postgress_vm591_externalid
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
