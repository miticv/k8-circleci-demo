# Deploy Nodejs to Azure K8 with CircleCI

## Install the dependencies

Install the dependencies using the following command:

```bash
npm install
```

## Running the application

```bash
node app.js
```

## Link to related repos:

- [Github k8-circleci-demo](https://github.com/miticv/k8-circleci-demo/)

- [CircleCi k8-circleci-demo](https://app.circleci.com/pipelines/github/miticv/k8-circleci-demo)

- [DockerHub nodejs-aks-app](https://hub.docker.com/repository/docker/miticv/nodejs-aks-app/general)

- [Azure k8 democloud nodejs](https://portal.azure.com/#@miticvgmail.onmicrosoft.com/resource/subscriptions/e7feae5d-2e46-470e-a5b3-5eb025fd598e/resourceGroups/resource-democloud/providers/Microsoft.ContainerService/managedClusters/democloud/workloads)

- [Deployed Website](http://20.31.164.245)

## Kubectl Documentation

Node > multiple Pods (each has IP)>  Each Pod holds container

Helpful shortcut
```powershell
Set-Alias -Name k -Value kubectl
``` 

Login
```powershell 
az account set --subscription e7feae5d-2e46-470e-a5b3-5eb025fd598e
az aks get-credentials --resource-group resource-democloud --name democloud
kubectl version
```

Set default namespace
```powershell 
kubectl config set-context --current --namespace=nodejs
kubectl get deployments # --namespace nodejs
kubectl get pods # --namespace nodejs 
kubectl get all # --namespace nodejs 
kubectl get services
```


Demo create, forward, delete
```powershell
kubectl run [name-of-pod] --image=nginx:alpine # 
kubectl get pods
kubectl port-forward [name-of-pod] 8080:80 # externalPort-onYourLocalMachineToConnectToIt:internalPortToThePod
kubectl delete pod [name-of-pod] # it will replaced with new one if using service
kubectl delete deployment [name-of-deployment]
```

with yaml, can be of kind (Pod, Deployment, Service, Namespace )
```powershell
kubectl create -f file.pod.yaml --dry-run #trial run
kubectl describe pod [podname] # shows history of the pod
kubectl exec [podname] -it sh
kubectl apply -f file.pod.yaml # create or update
kubectl apply -f file.pod.yaml --save-config #save 
kubectl edit -f file.pod.yaml
kubectl delete -f file.pod.yaml
```

Deployments (kind: Deployments)
* Rollback
* Resources (limit mem, cpu)
* ReplicaSet
  * Manages Pods
```powershell
kubectl get deployment --show-labels
kubectl get deployment -l app=nginx
kubectl apply -f file.deployment.yaml --save-config
kubectl delete -f file.deployment.yaml
kubectl scale deployment -f file.deployment.yaml --replicas=5
kubectl scale deployment [deployment-name] --replicas=5
kubectl describe deployment [deployment-name] 
```

Services (kind: Service)
* Single point of entry for accessing one or more Pods
* Service will have IP address and not mortal (long lived)
* Load balancer is service
(type: )
1. ClusterIp (exposes IP to talk to pod)
2. NodePort (expose static port of the node to talk to pod)
3. LoadBalancer (Routes on nodes based on traffic)
4. ExternalName (alias or proxy for external service)

```powershell
kubectl port-forward pod/[podname] 8080:80
kubectl port-forward deployment/[deployment-name] 8080:80
kubectl port-forward service/[service-name] 8080:80


kubectl create -f file.service.yaml
kubectl apply -f file.service.yaml
kubectl delete -f file.service.yaml

kubectl exec [pod-name] -- curl -s http://podIp:8080
kubectl exec [pod-name] -it sh
    > apk add curl
    > curl -s http://podIp:8080
```