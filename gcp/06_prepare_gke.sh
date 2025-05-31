#!/bin/bash
# === TAREA 6: Configurar GKE con volumen y secrets ===
# Autenticarse con el clúster
gcloud container clusters get-credentials griffin-dev-cluster --zone=$ZONE

# Crear el volumen persistente
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: wp-pv-claim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 200Mi
EOF

# Crear secret para acceso a MySQL
kubectl create secret generic wp-db-credentials \
  --from-literal=username=root \
  --from-literal=password=griffinDev123
