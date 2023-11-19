@description('Azure region for all resource deployments')
param location string

@minLength(3)
@maxLength(24)
@description('Provide a storage account name, 3-24 lowercase alphanumeric characters. Must be unique across Azure.')
param storageName string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'Vnet01'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
