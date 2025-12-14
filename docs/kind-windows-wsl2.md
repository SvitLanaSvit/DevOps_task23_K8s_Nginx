# KIND (Kubernetes in Docker) setup on Windows using Ubuntu (WSL2)

## 1. PREREQUISITES
- Windows with Docker Desktop installed
- WSL2 enabled
- Ubuntu installed via WSL2
- Docker Desktop WSL integration enabled for Ubuntu

### Check Docker availability
```bash
docker ps
```

---
## 2. INSTALL KIND
```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

### Verify KIND installation
```bash
kind --version
```

---
## 3. INSTALL kubectl
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

### Verify kubectl installation
```bash
kubectl version --client
```

---
## 4. CREATE KIND CLUSTER
```bash
kind create cluster --name demo
```

---
## 5. VERIFY CLUSTER
```bash
kubectl get nodes
```

---
## 6. OPTIONAL: DELETE CLUSTER
```bash
kind delete cluster --name demo
```
