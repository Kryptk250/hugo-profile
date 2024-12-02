name: Deploy Node.js app to Azure

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '18'

    - name: Install dependencies
      run: npm install  # Ensure package.json is present in the directory

    - name: Build the application (if needed)
      run: npm run build

    - name: Deploy to Azure Web App
      uses: azure/webapps-deploy@v2
      with:
        app-name: <your-app-name>  # Replace with your Azure App Service name
        publish-profile: ${{ secrets.AZURE_PUBLISH_PROFILE }}  # Azure publish profile secret
        package: .  # Deploy the current directory
