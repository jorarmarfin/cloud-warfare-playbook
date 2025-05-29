# ⚙️ GCP Cloud Function + Pub/Sub Gen 2 - Lab

Este mini laboratorio implementa una **Google Cloud Function Gen2** en Node.js que se activa mediante un mensaje de **Pub/Sub**.

---

## ✅ Habilitar servicios necesarios

```bash
gcloud services enable pubsub.googleapis.com
gcloud services enable cloudfunctions.googleapis.com
```

---

## 🚀 Desplegar la Cloud Function

```bash
gcloud functions deploy nodejs-pubsub-function \
  --gen2 \
  --runtime=nodejs20 \
  --region=us-central1 \
  --source=. \
  --entry-point=helloPubSub \
  --trigger-topic cf-demo \
  --stage-bucket qwiklabs-gcp-04-dc2fb50d4c1e-bucket \
  --service-account cloudfunctionsa@qwiklabs-gcp-04-dc2fb50d4c1e.iam.gserviceaccount.com \
  --allow-unauthenticated
```

> ⚠️ **Nota:**  
> Si recibes una notificación sobre `serviceAccountTokenCreator`, responde **“n”** para no otorgar ese rol automáticamente.

---

## 🔍 Ver detalles de la función

```bash
gcloud functions describe nodejs-pubsub-function \
  --region=us-central1
```

---

## 📩 Publicar un mensaje en el tópico de Pub/Sub

```bash
gcloud pubsub topics publish cf-demo --message="Cloud Function Gen2"
```

---

## 📜 Leer los logs de ejecución

```bash
gcloud functions logs read nodejs-pubsub-function \
  --region=us-central1
```

---

## 📎 Notas adicionales

- El entry point `helloPubSub` debe coincidir con el nombre de la función exportada en tu código `index.js`.
- El bucket de staging (`--stage-bucket`) debe existir previamente en tu proyecto.
- Puedes validar el funcionamiento viendo si los logs incluyen el mensaje `"Cloud Function Gen2"`.

---

