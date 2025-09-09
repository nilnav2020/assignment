# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ENV NODE_ENV=production
RUN npm run build

# Stage 2: Serve with Nginx (non-root)
FROM nginx:mainline-alpine3.22-perl@sha256:b04b512a3daf265299d237dcef02909b4f3fa998800030d1beef22e29d36ee97

# Remove default assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built assets
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Fix permissions for non-root
RUN mkdir -p /var/cache/nginx /var/run /etc/nginx/tmp \
    && chown -R 1000:1000 /var/cache/nginx /var/run /usr/share/nginx /etc/nginx

USER 1000:1000

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
