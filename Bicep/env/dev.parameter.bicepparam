using '../main.bicep'

param deploySSHParam = true

param resourceGroupUKSParam = {
  name: 'demo'
  location: 'uksouth'
}

param tagsParam = {
  owner: 'nacho'
  workload: 'agentPool'
  application: 'azureDevOps'
  env: 'lab'
}

param vnetParam = {
  name: 'adoagentpool-vnet'
  subnetName: 'default'
  addressPrefix: '10.0.0.0/16'
  subnetAddressPrefix: '10.0.2.0/24'
}

param vmParam = {
  name: 'adoagentpoolo-vm'
  size: 'Standard_D2s_v3'
  imageReference: {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-focal'
    sku: '20_04-lts-gen2'
    version: 'latest'
  }
  adminUsername: 'admin-azureevents'
  sshPublicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9NB8edUUaDk68IKpW/H0tMK32R0P0eyI7gC2VeA6/X3rZgUJE6ag7kj2qmD1UYcp3KBoAjQPLQIJHc7vN739QVLUlRLldqdLBTTNegXKL08/J2SlS+oc/lpdoMuSi9qxR5HbgDHna0jbL8pKvK5ctDtcwYj7EFPpNdPYg3fv1p3rq6AxHZjs/aiOERMQ2hs4q3A+NpDvPf4xzEypZTXVJtfuEaP69OAPRfy4UUEmFHFXx2VO0vTVjjSzh1PXlq6Y0763WVbdLM1qSiVcHBYreBcegS11nRF0ANEHyRoRb4cgrC1u72TZ2zkH0HhwaVrg/XXXhM+H0+xloDy1SAIunhMsnP4sC6y/7EtywcC+LbVKbPRcw0hQhYrS5nD9SLf43r6dmVh1XAZIH5FFczwFza26rJXtWpDQh+Jea5+2FDf9IgSO1Wsa+S6ETVpq+u3YS7DO3dYT5E0fa4k6KSV8ePtOafdoZjW2cMgx+MQOKmCh6NgVT/rvQpXX8WnpqXun1DgaWu1RRCBYA4oB6rhKJFttH8FLY/qQYRYNbwzf/WUpJHtrs43GVpIz7ACmmxvC8En4awO1mnZJsZB9ZsmHKtx3orDHl5xlW9ybvZsScBM/FZgC+1nIWL9+nv/P6TggBVbwqt3hpXwGsgSpYuqui5fCtX+6ZgcdZg7UHuLkgBQ== Ihean@Chukwu'
}

