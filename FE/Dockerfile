# Multi-stage build
# Imagen base
FROM node:16.10.0-buster as build-stage

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el fichero de configuración
COPY package.json /app

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . /app

# Construcción de estaticos
RUN npm run build


# Multi-stage prod
# Imagen base
FROM nginx:stable-alpine as prod-stage

# Añadir metadatos
LABEL group="2" \
description="frontend" \
version="1.0"

# Copiar codigo estatico
COPY --from=build-stage /app/build /usr/share/nginx/html

# Definir variable de entorno para el puerto y exponer el puerto por el que escucha la aplicación
ENV PORT=80
EXPOSE $PORT

# Ejecutar el proceso dentro del contenedor
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
