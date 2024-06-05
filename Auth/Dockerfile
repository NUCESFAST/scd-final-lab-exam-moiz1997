FROM node:14

WORKDIR /

COPY package*.json ./

RUN npm install

COPY . .

# Add 1 before roll number plus 2000
EXPOSE 13104

CMD [ "node", "index.js" ]