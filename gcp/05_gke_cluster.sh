#!/bin/bash
# === TAREA 5: Crear clúster Kubernetes ===
gcloud container clusters create griffin-dev-cluster \
  --zone=$ZONE \
  --network=griffin-dev-vpc \
  --subnetwork=griffin-dev-wp
