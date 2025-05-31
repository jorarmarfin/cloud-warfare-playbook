#!/bin/bash
# === TAREA 7: Desplegar WordPress ===

cat <<EOF > wp-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wp-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wordpress
  template:
    metadata:
      labels:
        app: wordpress
    spec:
      containers:
      - name: wordpress
        image: wordpress:4.8-apache
        env:
        - name: WORDPRESS_DB_HOST
          value: 127.0.0.1:3306
        - name: WORDPRESS_DB_USER
          valueFrom:
            secretKeyRef:
              name: wp-db-credentials
              key: username
        - name: WORDPRESS_DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: wp-db-credentials
              key: password
        ports:
        - containerPort: 80
        volumeMounts:
        - name: wordpress-persistent-storage
          mountPath: /var/www/html
      volumes:
      - name: wordpress-persistent-storage
        persistentVolumeClaim:
          claimName: wp-pv-claim
EOF

# Aplicar el deployment
kubectl apply -f wp-deployment.yaml

# Exponer el servicio
kubectl expose deployment wp-deployment --type=LoadBalancer --port=80 --target-port=80
