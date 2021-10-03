# Imagen base
FROM node:16.10.0-buster

# Añadir metadatos
LABEL group="2" \
description="backend" \
version="1.0"

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el fichero de configuración
COPY package.json /app

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . /app

# Definir variable de entorno para el puerto y exponer el puerto por el que escucha la aplicación
ENV PORT=8081
EXPOSE $PORT

# Ejecutar el proceso dentro del contenedor
ENTRYPOINT ["npm"]
CMD ["start"]
