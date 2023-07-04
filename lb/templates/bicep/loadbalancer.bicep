param loadBalancers_applb_name string = 'applb'
param publicIPAddresses_loadbalancerip_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/rg-exchange/providers/Microsoft.Network/publicIPAddresses/loadbalancerip'
param virtualNetworks_vnet_shared_westus_externalid string = '/subscriptions/f2bbcd61-a6e1-46c2-b5c7-57365b68854c/resourceGroups/rg-exchange/providers/Microsoft.Network/virtualNetworks/vnet-shared-westus'

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
            id: publicIPAddresses_loadbalancerip_externalid
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
                  id: virtualNetworks_vnet_shared_westus_externalid
                }
              }
            }
            {
              name: '0135173f-2448-4212-acb1-4710d198dd4d'
              properties: {
                ipAddress: '10.0.2.11'
                virtualNetwork: {
                  id: virtualNetworks_vnet_shared_westus_externalid
                }
              }
            }
            {
              name: '767914fc-882d-41aa-ae80-7f10b2e2a59d'
              properties: {
                ipAddress: '10.0.2.8'
                virtualNetwork: {
                  id: virtualNetworks_vnet_shared_westus_externalid
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
            id: virtualNetworks_vnet_shared_westus_externalid
          }
        }
      }
      {
        name: '0135173f-2448-4212-acb1-4710d198dd4d'
        properties: {
          ipAddress: '10.0.2.11'
          virtualNetwork: {
            id: virtualNetworks_vnet_shared_westus_externalid
          }
        }
      }
      {
        name: '767914fc-882d-41aa-ae80-7f10b2e2a59d'
        properties: {
          ipAddress: '10.0.2.8'
          virtualNetwork: {
            id: virtualNetworks_vnet_shared_westus_externalid
          }
        }
      }
    ]
  }
  dependsOn: [
    loadBalancers_applb_name_resource
  ]
}
