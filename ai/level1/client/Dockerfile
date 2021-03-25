FROM node:12.19.1-slim as builder
WORKDIR /app
COPY package* ./
RUN npm install
COPY public/ public/
COPY src/ src/
RUN npm run build

FROM nginx:1.19.8-alpine
COPY --from=builder /app/build/ /usr/share/nginx/html/
