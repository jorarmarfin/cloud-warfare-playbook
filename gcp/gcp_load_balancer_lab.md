# 🌐 Implement Load Balancing on Compute Engine - Challenge Lab (GSP313)

Este laboratorio tiene como objetivo implementar un balanceador de carga HTTP utilizando **Google Compute Engine**. Incluye la creación de una plantilla de instancia, un grupo manejado, una regla de firewall, y el backend con chequeo de salud.

🔗 [Ver solución en video](https://youtu.be/8JjC9tv2T-w)

---

## 📌 Variables de entorno
```bash
export INSTANCE=nucleus-jumphost-634
export FIREWALL=permit-tcp-rule-648
export ZONE=europe-west4-c
export REGION=europe-west4
```

---

## ✅ Tarea 1: Crear una instancia jumphost
Esta instancia servirá como punto de acceso o puente a otras instancias si fuera necesario.
```bash
gcloud compute instances create $INSTANCE     --zone=$ZONE     --machine-type=e2-micro
```

---

## ✅ Tarea 2: Configurar un Load Balancer HTTP

### 1. Crear script de inicio que instale NGINX
```bash
cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF
```

### 2. Crear plantilla de instancia
```bash
gcloud compute instance-templates create web-server-template \
    --metadata-from-file startup-script=startup.sh \
    --machine-type e2-medium \
    --region $REGION
```

### 3. Crear grupo de instancias manejado
```bash
gcloud compute instance-groups managed create web-server-group \
    --base-instance-name web-server \
    --size 2 \
    --template web-server-template \
    --region $REGION
```

### 4. Crear regla de firewall para permitir tráfico HTTP
```bash
gcloud compute firewall-rules create $FIREWALL \
    --allow tcp:80 \
    --network default
```

### 5. Crear chequeo de salud HTTP
```bash
gcloud compute http-health-checks create http-basic-check
```

### 6. Asignar puertos nombrados al grupo de instancias
```bash
gcloud compute instance-groups managed \
    set-named-ports web-server-group \
    --named-ports http:80 \
    --region $REGION
```

### 7. Crear backend service con el health check
```bash
gcloud compute backend-services create web-server-backend \
    --protocol HTTP \
    --http-health-checks http-basic-check \
    --global
```

### 8. Agregar grupo de instancias al backend service
```bash
gcloud compute backend-services add-backend web-server-backend \
    --instance-group web-server-group \
    --instance-group-region $REGION \
    --global
```

### 9. Crear mapa de URLs
```bash
gcloud compute url-maps create web-server-map \
    --default-service web-server-backend
```

### 10. Crear proxy HTTP
```bash
gcloud compute target-http-proxies create http-lb-proxy \
    --url-map web-server-map
```

### 11. Crear regla de reenvío global para tráfico HTTP
```bash
gcloud compute forwarding-rules create http-content-rule \
    --global \
    --target-http-proxy http-lb-proxy \
    --ports 80
```

### 12. Verificar la regla de reenvío creada
```bash
gcloud compute forwarding-rules list
```

---

## 🙌 Resultado Esperado

Al finalizar, el balanceador de carga debería distribuir tráfico HTTP entre las dos instancias del grupo gestionado, cada una corriendo NGINX y sirviendo contenido dinámico con su nombre de host.

---

**¡Dios te bendiga mientras balanceas tráfico y cargas pesadas de la vida también! ☁️🙏**
