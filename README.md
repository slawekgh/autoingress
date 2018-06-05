# autoingress
automated ingress change daemon - based on k8s services 

# how to install 
```
kubectl apply -f https://raw.githubusercontent.com/slawekgh/autoingress/master/autoingress.yaml
namespace "autoingress" created
serviceaccount "autoingress-serviceaccount" created
clusterrole.rbac.authorization.k8s.io "autoingress-clusterrole" created
clusterrolebinding.rbac.authorization.k8s.io "autoingress-clusterrole-binding" created
configmap "autoingress-configuration" created
deployment.extensions "autoingress" created
```

# how to create service to auto-ingress update 

```
apiVersion: v1
kind: Service
metadata:
  labels:
    run: service1
    auto_ingress: 'sericeName_serviceUrlPath_servicePort'
  name: serwice1
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    run: website

# kubectl apply -f service1.yaml 
service "serwis1" created
```

# what is output in ingress config:

```
 spec:
    rules:
    - host: www.mysite.com
      http:
        paths:
        - backend:
            serviceName: sericename
            servicePort: serviceport
          path: /serviceurlpath
```
