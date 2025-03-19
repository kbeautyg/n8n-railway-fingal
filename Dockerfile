FROM node:20-alpine

ARG N8N_VERSION=latest

# Instala dependências do sistema
RUN apk add --update graphicsmagick tzdata python3 make g++ \
    && npm_config_user=root npm install --location=global n8n@${N8N_VERSION}

# Define diretório de trabalho
WORKDIR /data

# Expondo a porta (Railway define PORT automaticamente)
EXPOSE $PORT

# UID fixo (evita problemas com permissões)
ENV N8N_USER_ID=1000

# Inicia o n8n
CMD ["n8n", "start"]
