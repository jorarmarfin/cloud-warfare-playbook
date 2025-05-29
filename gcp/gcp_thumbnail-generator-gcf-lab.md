# 🌩️ Google Cloud Challenge Lab - Proyecto Recuerdos

Este repositorio documenta paso a paso cómo completar el laboratorio de Google Cloud que consiste en configurar una infraestructura básica para un equipo de desarrollo llamado **Recuerdos**, encargado de almacenar y generar miniaturas de imágenes usando Pub/Sub y Cloud Functions Gen2.

---

## 🧾 Tareas completadas

### ✅ 1. Crear bucket para almacenar fotos

```bash
gsutil mb -l us-central1 -p $(gcloud config get-value project) \
  gs://qwiklabs-gcp-04-57338dcc3f53-bucket/
```

---

### ✅ 2. Crear un tópico de Pub/Sub

```bash
gcloud pubsub topics create topic-memories-254
```

---

### ✅ 3. Crear función Cloud Run (Cloud Functions Gen2)

#### Archivos

**`index.js`**
```js
const functions = require('@google-cloud/functions-framework');
const { Storage } = require('@google-cloud/storage');
const sharp = require('sharp');

functions.cloudEvent('memories-thumbnail-creator', async cloudEvent => {
  const event = cloudEvent.data;
  const fileName = event.name;
  const bucketName = event.bucket;

  if (!fileName || !bucketName) return;

  if (fileName.includes("64x64_thumbnail")) return;

  const bucket = new Storage().bucket(bucketName);
  const file = bucket.file(fileName);
  const thumbName = fileName.replace(/(\.[\w\d_-]+)$/i, '_64x64_thumbnail$1');
  const thumbFile = bucket.file(thumbName);

  try {
    const [imageBuffer] = await file.download();
    const resizedBuffer = await sharp(imageBuffer).resize(64, 64).toBuffer();
    await thumbFile.save(resizedBuffer, { contentType: "image/jpeg" });
    console.log(`Thumbnail created: ${thumbName}`);
  } catch (err) {
    console.error("Error creating thumbnail:", err);
  }
});
```

**`package.json`**
```json
{
  "name": "thumbnails",
  "version": "1.0.0",
  "description": "Create Thumbnail of uploaded image",
  "main": "index.js",
  "dependencies": {
    "@google-cloud/functions-framework": "^3.0.0",
    "@google-cloud/storage": "^6.11.0",
    "sharp": "^0.32.1"
  },
  "engines": {
    "node": ">=18"
  }
}
```

#### Despliegue

```bash
gcloud functions deploy memories-thumbnail-creator \
  --gen2 \
  --runtime=nodejs22 \
  --region=us-central1 \
  --source=. \
  --entry-point=memories-thumbnail-creator \
  --trigger-event-filters="type=google.cloud.storage.object.v1.finalized" \
  --trigger-event-filters="bucket=qwiklabs-gcp-04-57338dcc3f53-bucket" \
  --allow-unauthenticated
```

---

### ✅ 4. Quitar al ingeniero anterior del proyecto

```bash
gcloud projects remove-iam-policy-binding $(gcloud config get-value project) \
  --member="user:student-04-a0a52d0b1a5d@qwiklabs.net" \
  --role="roles/viewer"
```

---

## 🧪 Prueba de la función

Subir imagen:

```bash
wget https://storage.googleapis.com/cloud-training/gsp315/map.jpg
gsutil cp map.jpg gs://qwiklabs-gcp-04-57338dcc3f53-bucket
```

Ver logs:

```bash
gcloud functions logs read memories-thumbnail-creator --region=us-central1
```

---

## ✅ Resultado final

- Imagen miniatura generada exitosamente.
- Pub/Sub funcionando.
- Usuarios actualizados.
- Proyecto aprobado ✔️

---

**¡Dios te bendiga mientras automatizas hasta las imágenes! ☁️📸🙏**
