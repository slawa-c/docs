# K8s

[Содержание](../README.md)

*Note: LinuxMint 19.3 witch Xfce 64-bit

A. Minikube supports Kubernetes features such as:

    DNS
    NodePorts
    ConfigMaps and Secrets
    Dashboards
    Container Runtime: Docker, CRI-O, and containerd
    Enabling CNI (Container Network Interface)
    Ingress
    PersistentVolumes of type hostPath

1. Обновление :

    ```bash
    sudo apt-get update
    sudo apt-get install apt-transport-https
    sudo apt-get upgrade
    ```

2. Install VirtualBox or KVM
   
   [virt](../mint-virt/README.md) **"virt"**
   https://github.com/vitovts/mint/edit/master/mint-virt/README.MD
   
   
   ```bash
   
   ```

3. Download minikube

    ```bash
    wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo chmod +x minikube-linux-amd64
    sudo mv minikube-linux-amd64 /usr/local/bin/minikube
    ```
    
    ```bash
    minikube version
    ```
        minikube version: v1.10.1
        commit: 63ab801ac27e5742ae442ce36dff7877dcccb278
    

4. Install kubectl
    
   ```bash
   curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
   ```

Make the kubectl binary executable.
    
```bash
sudo chmod +x ./kubectl     
```

Move the binary in to your PATH:

```bash
sudo mv ./kubectl /usr/local/bin/kubectl
```

Check version:
```bash
kubectl version -o json 

```output
{
     "clientVersion": {
     "major": "1",
     "minor": "18",
     "gitVersion": "v1.18.3",
     "gitCommit": "2e7996e3e2712684bc73f0dec0200d64eec7fe40",
     "gitTreeState": "clean",
     "buildDate": "2020-05-20T12:52:00Z",
     "goVersion": "go1.13.9",
     "compiler": "gc",
     "platform": "linux/amd64"
    }
    }
    The connection to the server localhost:8080 was refused - did you specify the right host or port?
```

5. Starting minikube

```bash
minikube start --host-only-cidr=192.168.90.1/24 

```output    
* minikube v1.10.1 on Linuxmint 19.3
* Automatically selected the virtualbox driver
* Starting control plane node minikube in cluster minikube
* Creating virtualbox VM (CPUs=2, Memory=2200MB, Disk=20000MB) ...
* Preparing Kubernetes v1.18.2 on Docker 19.03.8 ...
* Verifying Kubernetes components...
* Enabled addons: default-storageclass, storage-provisioner
* Done! kubectl is now configured to use "minikube"
```

6. Minikube Basic operations
  
6.1  Check cluster status:
  
```bash
kubectl cluster-info
```
```output
Kubernetes master is running at https://192.168.90.100:8443
KubeDNS is running at https://192.168.90.100:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

6.2 View Config, use:

```bash
kubectl config view
```output
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /home/ws/.minikube/ca.crt
    server: https://192.168.90.100:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /home/ws/.minikube/profiles/minikube/client.crt
    client-key: /home/ws/.minikube/profiles/minikube/client.key
```

6.3 Check running nodes:
   
```bash
kubectl get nodes    

```output
NAME       STATUS   ROLES    AGE     VERSION
minikube   Ready    master   9m53s   v1.18.2
```

6.4 Access minikube VM using ssh:
    
```bash
minikube ssh
```

6.5 Stop a running local kubernetes cluster:
    
```bash
minikube stop
```
    
6.6 Delete a local kubernetes cluster:
    
```bash
minikube delete
```

7. Enable Kubernetes Dashboard

```bash
minikube addons list
```

|-----------------------------|----------|--------------|
|         ADDON NAME          | PROFILE  |    STATUS    |
|-----------------------------|----------|--------------|
| dashboard                   | minikube | disabled     |
| default-storageclass        | minikube | enabled      |
| efk                         | minikube | disabled     |
| freshpod                    | minikube | disabled     |
| gvisor                      | minikube | disabled     |
| helm-tiller                 | minikube | disabled     |
| ingress                     | minikube | disabled     |
| ingress-dns                 | minikube | disabled     |
| istio                       | minikube | disabled     |
| istio-provisioner           | minikube | disabled     |
| logviewer                   | minikube | disabled     |
| metallb                     | minikube | disabled     |
| metrics-server              | minikube | disabled     |
| nvidia-driver-installer     | minikube | disabled     |
| nvidia-gpu-device-plugin    | minikube | disabled     |
| registry                    | minikube | disabled     |
| registry-aliases            | minikube | disabled     |
| registry-creds              | minikube | disabled     |
| storage-provisioner         | minikube | enabled      |
| storage-provisioner-gluster | minikube | disabled     |
|-----------------------------|----------|--------------|


 7.1 Open directly on your default browser, use:

```bash
minikube dashboard
```

7.2 Get the URL of the dashboard
    
```bash
minikube dashboard --url
http://192.168.39.117:30000
```






    
    
 
 
 






[Назад к содержанию](../README.md)
