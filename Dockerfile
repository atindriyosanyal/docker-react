FROM node:alpine AS builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff we care about

FROM nginx

# communication for developers
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html