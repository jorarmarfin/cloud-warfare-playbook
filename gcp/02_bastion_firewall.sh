#!/bin/bash
# === TAREA 3: Bastion host ===
gcloud compute instances create griffin-jumphost   --zone=$ZONE   --machine-type=e2-micro   --subnet=griffin-prod-mgmt   --tags=ssh   --image-family=debian-11   --image-project=debian-cloud

gcloud compute firewall-rules create griffin-allow-ssh   --network=griffin-prod-vpc   --allow=tcp:22   --source-ranges=0.0.0.0/0   --target-tags=ssh
