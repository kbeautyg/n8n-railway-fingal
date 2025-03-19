FROM node:20-alpine

ARG N8N_VERSION=latest

# Instala dependências do sistema
RUN apk add --update graphicsmagick tzdata python3 make g++ \
    && npm_config_user=root npm install --location=global n8n@${N8N_VERSION}

# Define diretório de trabalho
WORKDIR /data

# Expondo a porta (Railway define PORT automaticamente)
EXPOSE 5678

# UID fixo (evita problemas com permissões)
ENV N8N_USER_ID=1000

# PORTA N8N
ENV N8N_PORT=5678

# Inicia o n8n
CMD ["n8n", "start"]
