# 💬 GCP Pub/Sub Básico - Laboratorio

Este laboratorio explora el uso básico de **Google Cloud Pub/Sub**, incluyendo creación de tópicos, suscripciones, publicación y consumo de mensajes.

---

## 🎯 Objetivo

- Crear y gestionar **tópicos**.
- Crear y eliminar **suscripciones**.
- Publicar mensajes y consumirlos con `pull`.
- Comprender el flujo básico **Publisher → Topic → Subscription → Subscriber**.

---

## 📌 Crear tópicos

```bash
gcloud pubsub topics create myTopic
gcloud pubsub topics create Test1
gcloud pubsub topics create Test2
```

---

## 📋 Listar tópicos

```bash
gcloud pubsub topics list
```

---

## ❌ Eliminar tópicos

```bash
gcloud pubsub topics delete Test1
gcloud pubsub topics delete Test2
gcloud pubsub topics list
```

---

## 📬 Crear suscripciones a un tópico

```bash
gcloud pubsub subscriptions create --topic myTopic mySubscription
gcloud pubsub subscriptions create --topic myTopic Test1
gcloud pubsub subscriptions create --topic myTopic Test2
```

---

## 🔍 Listar suscripciones de un tópico

```bash
gcloud pubsub topics list-subscriptions myTopic
```

---

## 🧹 Eliminar una suscripción

```bash
gcloud pubsub subscriptions delete Test1
```

---

## ✉️ Publicar mensajes

```bash
gcloud pubsub topics publish myTopic --message "Hello"
gcloud pubsub topics publish myTopic --message "Publisher's name is Luis"
gcloud pubsub topics publish myTopic --message "Publisher likes to eat Pollo"
gcloud pubsub topics publish myTopic --message "Publisher thinks Pub/Sub is awesome"
```

---

## 📥 Leer mensajes desde la suscripción

```bash
gcloud pubsub subscriptions pull mySubscription --auto-ack
```

> Ejecutar varias veces permite ver cómo se entregan los mensajes publicados.

---

## 📥 Leer múltiples mensajes a la vez

```bash
gcloud pubsub topics publish myTopic --message "Publisher is starting to get the hang of Pub/Sub"
gcloud pubsub topics publish myTopic --message "Publisher wonders if all messages will be pulled"
gcloud pubsub topics publish myTopic --message "Publisher will have to test to find out"

gcloud pubsub subscriptions pull mySubscription --auto-ack --limit=3
```

---

## 🧠 Tips

- `--auto-ack` confirma automáticamente la recepción del mensaje.
- `--limit=n` permite controlar cuántos mensajes se extraen en un `pull`.

---

## ✨ Nombre sugerido

**`pubsub-core-lab.md`**

---

**¡Dios te bendiga mientras publicas buenas nuevas, no solo en Pub/Sub! 🙌💻**
