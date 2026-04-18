## connect to the cluster

aws eks update-kubeconfig --region ap-south-1  --name my-cluster-final 

# 🚀 Istio Bookinfo Deployment on Kubernetes (EKS)

## 📌 Overview

This project demonstrates how to deploy Istio Service Mesh and the Bookinfo microservices application on Kubernetes.

Bookinfo Services:

* productpage – Frontend
* details – Book info
* reviews – v1, v2, v3
* ratings – Ratings service

---

## ⚙️ Step 1: Install Istio

```
istioctl install --set profile=demo -y
```

Verify:

```
kubectl get pods -n istio-system
```

---

## 🏷️ Step 2: Enable Sidecar Injection

```
kubectl create namespace bookinfo
kubectl label namespace bookinfo istio-injection=enabled
kubectl get ns --show-labels
```

---

## 📦 Step 3: Deploy Bookinfo App

```
kubectl apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl get pods -n bookinfo
```

---

## 🔍 Step 4: Verify Sidecar Injection

```
kubectl get pods -n bookinfo
```

Expected:

```
2/2 Running
```

---

## 🌐 Step 5: Expose via Istio Gateway

```
kubectl apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/networking/bookinfo-gateway.yaml
```

---

## 🌍 Step 6: Access Application

Get external IP:

```
kubectl get svc istio-ingressgateway -n istio-system
```

Get port:

```
kubectl get svc istio-ingressgateway -n istio-system -o jsonpath="{.spec.ports[?(@.name=='http2')].port}"
```

Open in browser:

```
http://<EXTERNAL-IP>/productpage
```

---

## 🚦 Step 7: Traffic Management

Apply destination rule:

```
kubectl apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/networking/destination-rule-all.yaml
```

Route to v1:

```
kubectl apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/networking/virtual-service-all-v1.yaml
```

Route to v2:

```
kubectl apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/networking/virtual-service-reviews-v2.yaml

```

Route to v3:

```
kubectl apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/networking/virtual-service-reviews-v3.yaml


```

---

## 🧠 Key Concepts

* Sidecar Proxy (Envoy)
* Gateway
* VirtualService
* DestinationRule

---

## 🔍 Troubleshooting

```
kubectl get pods -n bookinfo
kubectl logs <pod-name> -n bookinfo
kubectl get svc -n istio-system
kubectl describe pod <pod-name> -n bookinfo
```

---

## 🏁 Conclusion

* Istio installed successfully
* Bookinfo deployed
* Traffic routing working
* Service mesh basics understood

---



## after that   ee link open chesi mtls promothes and kalil and grafana enable cheyadam

https://chatgpt.com/share/69e1d653-fea0-8323-a365-d7aac4aec4b6


https://chatgpt.com/c/69e1cdd1-4f58-83ab-8ad2-e97e16e855fe