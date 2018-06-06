FROM node:carbon as builder

COPY . /app
WORKDIR /app

RUN npm install
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html
