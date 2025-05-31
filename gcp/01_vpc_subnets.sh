#!/bin/bash
# === TAREA 1: Crear VPC de desarrollo ===
export REGION=us-east1
export ZONE=us-east1-b

gcloud compute networks create griffin-dev-vpc --subnet-mode=custom
gcloud compute networks subnets create griffin-dev-wp   --network=griffin-dev-vpc   --region=$REGION   --range=192.168.16.0/20

# === TAREA 2: Crear VPC de producción ===
gcloud compute networks create griffin-prod-vpc --subnet-mode=custom
gcloud compute networks subnets create griffin-prod-mgmt   --network=griffin-prod-vpc   --region=$REGION   --range=192.168.32.0/20
