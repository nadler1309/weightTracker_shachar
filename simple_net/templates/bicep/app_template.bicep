param virtualMachines_app_vm_name string = 'app-vm'
param disks_app_vm_OsDisk_1_6e8b0299c6d3425eae2d43b933d0ef76_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/RG-EXCHANGE/providers/Microsoft.Compute/disks/app-vm_OsDisk_1_6e8b0299c6d3425eae2d43b933d0ef76'
param networkInterfaces_app_vm782_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/rg-exchange/providers/Microsoft.Network/networkInterfaces/app-vm782'

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
          id: disks_app_vm_OsDisk_1_6e8b0299c6d3425eae2d43b933d0ef76_externalid
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
          id: networkInterfaces_app_vm782_externalid
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
