#!/bin/bash
# === TAREA 4: Crear base de datos MySQL ===
gcloud sql instances create griffin-dev-db \
  --database-version=MYSQL_5_7 \
  --tier=db-f1-micro \
  --region=$REGION \
  --root-password=griffinDev123

# Crear base de datos wordpress
gcloud sql databases create wordpress --instance=griffin-dev-db
