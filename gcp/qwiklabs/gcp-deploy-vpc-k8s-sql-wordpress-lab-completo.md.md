# 🏅 deploy-vpc-k8s-sql-wordpress-lab-completo.md

**Fecha de ejecución:** 2025-05-31 19:24:03
**Duración total:** 60 minutos  
**Resultado:** ✅ Insignia obtenida exitosamente

---

## 🚀 Resumen del reto

Este laboratorio consistió en configurar desde cero una infraestructura de red segura y escalable sobre Google Cloud Platform. Se desarrollaron 9 tareas críticas en tiempo real:

1. Crear una VPC de desarrollo `griffin-dev-vpc` con subredes `griffin-dev-wp` y `griffin-dev-mgmt`.
2. Crear una VPC de producción `griffin-prod-vpc` con subredes `griffin-prod-wp` y `griffin-prod-mgmt`.
3. Implementar una instancia *bastión* con doble interfaz de red.
4. Crear una instancia de Cloud SQL `griffin-dev-db`.
5. Desplegar un clúster de Kubernetes `griffin-dev`.
6. Preparar el clúster: montar secretos, claves de conexión y volúmenes persistentes.
7. Desplegar WordPress sobre Kubernetes.
8. Habilitar la supervisión.
9. Asignar rol de editor al segundo usuario del proyecto.

---

## ⚙️ Detalles técnicos y pormenores

```bash
# Variables de entorno (cambiar según el lab)
export REGION="us-east1"
export ZONE="us-east1-b"
```

```sql
-- Comandos de configuración en Cloud SQL
CREATE DATABASE wordpress;
CREATE USER "wp_user"@"%" IDENTIFIED BY "stormwind_rules";
GRANT ALL PRIVILEGES ON wordpress.* TO "wp_user"@"%";
FLUSH PRIVILEGES;
```

> 🧠 **Nota:** Al crear la instancia de Cloud SQL, evita `us-central1` si no está permitido por políticas.  
> ✅ Usa `us-east1` o `us-east4` según disponibilidad.

```bash
# Asignar permisos al segundo usuario
gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="user:student-02-xxxx@qwiklabs.net" \
  --role="roles/editor"
```

---

## 🌟 Testimonio

*"Conseguí terminar todo con 26 minutos de sobra gracias a una buena planificación. El truco: iniciar el clúster y la base SQL y avanzar mientras se crean. Angie, como siempre, gracias por ser mi estratega celestial en las nubes."*

---

**💡 Tips finales:**

- Automatiza lo repetitivo con scripts Bash.
- Usa múltiples consolas.
- Supervisa los tiempos de creación de Cloud SQL y GKE.
- Asegúrate de dar permisos adecuados a tiempo (usuario 2).

---

**#GoogleCloud #Kubernetes #CloudSQL #GCP #Qwiklabs #DevOps #WordPress #Certificado**
