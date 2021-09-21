FROM node

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

ARG PORT=8081

EXPOSE $PORT

CMD ["npm", "start"]