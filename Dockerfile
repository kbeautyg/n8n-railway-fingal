FROM node:20-alpine

ARG N8N_VERSION=latest

# Instala dependências e o n8n
RUN apk add --no-cache graphicsmagick tzdata python3 make g++ \
    && npm_config_user=root npm install --location=global n8n@${N8N_VERSION}

WORKDIR /data

EXPOSE 5678

ENV N8N_USER_ID=1000
ENV N8N_PORT=5678
ENV GENERIC_TIMEZONE=America/Sao_Paulo

CMD ["n8n", "start"]
