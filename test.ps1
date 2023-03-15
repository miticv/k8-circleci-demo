
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

$AZURE_SP_TENANT="" #tenant
$AZURE_SP="" #appId
$AZURE_SP_PASSWORD="" # password

# https://portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/RegisteredApps
# test service principal:
az login --service-principal --tenant $AZURE_SP_TENANT -u $AZURE_SP -p $AZURE_SP_PASSWORD

# Website git repo
https://github.com/miticv/k8-circleci-demo

#DockerHub
https://hub.docker.com/repository/docker/miticv/nodejs-aks-app/general

#Circle Ci
https://app.circleci.com/pipelines/github/miticv/k8-circleci-demo

#K8 Load Balancer for nodejs app:
http://20.31.164.245


