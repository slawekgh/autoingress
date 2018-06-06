while [ 1 ] ; do 

echo "
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: $INGRESSNAME
  namespace: $INGRESSNAMESPACE
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: $INGRESSHOST
    http:
      paths: " > ingress.yaml
SERVICE_LIST=`kubectl -n default get svc -o jsonpath='{.items[*].metadata.labels.auto_ingress}'`

for item in $SERVICE_LIST ; do 
	#serwis_path-uri_port
	SERVICE_NAME=`echo $item | awk -F"_" '{print $1}'`
	URI_PATH=`echo $item | awk -F"_" '{print $2}'`
	SERVICE_PORT=`echo $item | awk -F"_" '{print $3}'`

echo "
      - path: /$URI_PATH
        backend:
          serviceName: $SERVICE_NAME
          servicePort: $SERVICE_PORT
" >> ingress.yaml
done
kubectl apply -f ingress.yaml
sleep 5 

done

