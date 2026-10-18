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
- **Respuesta (201 Created):**
```json
{
  "title": "Nuevo Artículo de Prueba",
  "body": "Contenido del artículo creado para la Prac.",
  "userId": 1
}
## 3. PUT (Reemplazo completo de recurso)
- **Propósito:** Actualizar completamente un recurso existente. Si faltan campos en la solicitud, estos se sobrescriben o eliminan.
- **Ejemplo Endpoint:** `PUT /posts/1`
- **Cuerpo de Solicitud:**
json
{
"id": 1,
"title": "Título Completamente Actualizado",
"body": "Cuerpo completamente actualizado.",
"userId": 1
}

## 4. PATCH (Modificación parcial de recurso)
- **Propósito:** Modificar únicamente atributos específicos de un recurso sin alterar los demás campos.
- **Ejemplo Endpoint:** `PATCH /posts/1`
- **Cuerpo de Solicitud:**
json
{
"title": "Título Modificado Parcialmente"
}

## 5. DELETE (Eliminar recurso)
- **Propósito:** Remover un recurso específico del servidor.
- **Ejemplo Endpoint:** `DELETE /posts/1`
- **Respuesta (200 OK o 204 No Content):**

---

## Diferencia Clave entre PUT y PATCH

- **PUT:** Este realizara un remplazo total, incluso si un campo no es incluido en la peticion, este "faltante" se establecera como 'null' o lo eliminara del registro
- **PATCH:** Refiere a un cambio parcial, solo de lo que se pide, a diferencia del put, solo cambiara lo que le pide sin manipular los campos restantes, osea no los afecta.