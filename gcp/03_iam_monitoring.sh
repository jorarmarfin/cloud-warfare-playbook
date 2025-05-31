#!/bin/bash
# === TAREA 8: Monitoring (manual en UI pero dejamos nota) ===
echo "Ir a Monitoring UI > Alertas > Crear verificación de actividad sobre IP externa del WordPress"

# === TAREA 9: Dar acceso a otro estudiante ===
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member="user:student-01-72381a2632b5@qwiklabs.net" \
  --role="roles/editor"
