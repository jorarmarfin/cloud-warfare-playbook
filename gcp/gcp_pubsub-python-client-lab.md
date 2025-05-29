# 🐍 Google Cloud Pub/Sub con Python - Laboratorio

Este laboratorio guía la configuración de un entorno virtual en Python para interactuar con **Google Cloud Pub/Sub** usando su client library oficial. Incluye creación de tópicos, suscripciones, publicación y recepción de mensajes.

---

## 🛠️ Requisitos previos

Asegúrate de tener Python 3 y `pip` instalado.

---

## ⚙️ Preparar entorno virtual

```bash
sudo apt-get install -y virtualenv
python3 -m venv venv
source venv/bin/activate
```

---

## 📦 Instalar cliente Pub/Sub y clonar ejemplos

```bash
pip install --upgrade google-cloud-pubsub

git clone https://github.com/googleapis/python-pubsub.git
cd python-pubsub/samples/snippets
```

---

## 🚀 Crear tópico con script Python

```bash
python publisher.py $GOOGLE_CLOUD_PROJECT create MyTopic
```

## 📋 Listar tópicos existentes

```bash
python publisher.py $GOOGLE_CLOUD_PROJECT list
```

---

## 📬 Crear suscripción

```bash
python subscriber.py $GOOGLE_CLOUD_PROJECT create MyTopic MySub
```

## 📄 Listar suscripciones del proyecto

```bash
python subscriber.py $GOOGLE_CLOUD_PROJECT list-in-project
```

---

## 🆘 Ver ayuda de comandos disponibles

```bash
python subscriber.py -h
```

---

## ✉️ Publicar mensajes con `gcloud`

```bash
gcloud pubsub topics publish MyTopic --message "Hello"
gcloud pubsub topics publish MyTopic --message "Publisher's name is Luis"
gcloud pubsub topics publish MyTopic --message "Publisher likes to eat Pollo"
gcloud pubsub topics publish MyTopic --message "Publisher thinks Pub/Sub is awesome"
```

---

## 📥 Leer mensajes desde la suscripción

```bash
python subscriber.py $GOOGLE_CLOUD_PROJECT receive MySub
```

> Esta operación bloqueará la terminal hasta que lleguen mensajes. Presiona `Ctrl + C` para detener.

---

## 🧠 Tips

- Asegúrate de tener activada tu autenticación con `gcloud auth application-default login`.
- Puedes explorar y modificar los scripts `publisher.py` y `subscriber.py` para adaptarlos a tus necesidades.

---

## ✨ Nombre sugerido

**`pubsub-python-client-lab.md`**

---

**¡Dios te bendiga mientras programás suscriptores en nombre del mensaje eterno! 📯💻🙏**
