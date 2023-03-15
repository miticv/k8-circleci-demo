
# Creating Service Principal in Azure for CircleCi variables

$Sub="**598e" #2-Visual Studio Premium with MSDN

az login
az account set -s $Sub   
az ad sp create-for-rbac --role contributor --scopes /subscriptions/$Sub
{
    "appId": "",
    "displayName": "azure-cli-2023-03-15-14-44-22",
    "password": "",
    "tenant": ""
  }
# you have to save password as it will only show once here

$AZURE_SP_TENANT="" #tenant
$AZURE_SP="" #appId
$AZURE_SP_PASSWORD="" # password

# Credentials will show up here (but not password)
# https://portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/RegisteredApps

# to test service principal:
az login --service-principal --tenant $AZURE_SP_TENANT -u $AZURE_SP -p $AZURE_SP_PASSWORD

