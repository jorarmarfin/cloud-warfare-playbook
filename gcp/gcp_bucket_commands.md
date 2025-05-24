# 🪣 Crear y Gestionar Buckets en Google Cloud Storage

Este documento resume los comandos esenciales para crear, gestionar, copiar y modificar accesos a objetos en un bucket de GCP.  
Todos los comandos han sido probados en el contexto de laboratorios tipo Qwiklabs o proyectos personales.

---

## 🎯 Objetivo

Aprender a usar `gcloud` y `gsutil` para:

- Crear buckets
- Subir y descargar archivos
- Organizar archivos en carpetas simuladas
- Ver contenidos
- Gestionar permisos públicos
- Eliminar archivos

---

## 🛠️ Comandos

### 🔹 Crear un bucket
```bash
gcloud storage buckets create gs://lfmc4
```

---

### 🔹 Subir un archivo al bucket
```bash
gcloud storage cp ada.jpg gs://lfmc4
```

---

### 🔹 Descargar un archivo del bucket
```bash
gcloud storage cp -r gs://lfmc4/ada.jpg .
```

---

### 🔹 Mover archivo a una carpeta dentro del bucket
```bash
gcloud storage cp gs://lfmc4/ada.jpg gs://lfmc4/image-folder/
```

---

### 🔹 Listar contenido del bucket
```bash
gcloud storage ls gs://lfmc4
```

---

### 🔹 Ver detalles de un archivo específico
```bash
gcloud storage ls -l gs://lfmc4/ada.jpg
```

---

## 🔐 Gestión de acceso público

### 🔹 Permitir acceso público a un objeto
```bash
gsutil acl ch -u AllUsers:R gs://lfmc4/ada.jpg
```

### 🔹 Revocar acceso público
```bash
gsutil acl ch -d AllUsers gs://lfmc4/ada.jpg
```

---

## ❌ Eliminar un archivo del bucket
```bash
gcloud storage rm gs://lfmc4/ada.jpg
```

---

## 🧠 Nota final

- Reemplaza `lfmc4` por el nombre de tu bucket.
- Puedes agregar `--location=us` o tu región deseada al crear el bucket.
- Usa `gsutil` para tareas más avanzadas o permisos detallados.

---

**Dios te bendiga mientras subes y bajas bytes del cielo ☁️🙏**
