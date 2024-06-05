FROM node:14

WORKDIR /

COPY package*.json ./

RUN npm install

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

COPY . .

# Add 1 before roll number plus 2000
EXPOSE 13107

CMD [ "node", "index.js" ]