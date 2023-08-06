name: Run Azure Login with OpenID Connect
on: [ workflow_dispatch ]

permissions:
      id-token: write
      contents: read
      
jobs: 
  build-and-deploy:
    runs-on: mylab-vm
    steps:
    - name: 'Az CLI login'
      uses: azure/login@v1
      with:
          client-id: ${{ secrets.AZURE_CLIENT_ID }}
          tenant-id: ${{ secrets.AZURE_TENANT_ID }}
          subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
  
    - name: 'Run Azure CLI commands'
      run: |
          az account show
          az group list
          pwd