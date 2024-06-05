# Stage 1 - the build process
FROM node:14 as build-deps
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run build

# Stage 2 - the production environment
FROM nginx:1.17.8-alpine
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
COPY public/env.js /usr/share/nginx/html/env.js
COPY start.sh /usr/share/nginx/html/start.sh
RUN chmod +x /usr/share/nginx/html/start.sh
# Mapped to port with roll number (21i-1104) later on as nginx needs port 80
EXPOSE 80
CMD ["/usr/share/nginx/html/start.sh"]