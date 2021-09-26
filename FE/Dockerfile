FROM node

WORKDIR /app

COPY package.json /app
RUN npm install
COPY . /app

ARG PORT=3000
EXPOSE $PORT

CMD ["npm", "start"]
