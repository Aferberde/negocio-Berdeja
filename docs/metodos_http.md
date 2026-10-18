# Documentación de Métodos HTTP

En las arquitecturas REST, los métodos HTTP definen las acciones que se pueden realizar sobre los recursos del servidor. A continuación se detallan los 5 métodos principales utilizando la API pública JSONPlaceholder (`https://jsonplaceholder.typicode.com/posts`).

## 1. GET (Obtener recurso)
- **Propósito:** Recuperar información del servidor sin modificar ningún dato.
- **Ejemplo Endpoint:** `GET /posts/1`
- **Respuesta (200 OK):**
```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum..."
}
## 2. POST (Crear recurso)
- **Propósito:** Enviar datos al servidor para crear un nuevo recurso.
- **Ejemplo Endpoint:** `POST /posts`
- **Cuerpo de Solicitud (Payload):**
```json
{
  "title": "Nuevo Artículo de Prueba",
  "body": "Contenido del artículo creado para la práctica.",
  "userId": 1
}