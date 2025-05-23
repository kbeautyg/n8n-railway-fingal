FROM node:18-bullseye

ARG N8N_VERSION=1.93.0

# Устанавливаем системные зависимости
RUN apt-get update && \
    apt-get install -y graphicsmagick tzdata python3 build-essential && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем n8n глобально
RUN npm_config_user=root npm install -g n8n@${N8N_VERSION}

# Рабочая директория
WORKDIR /data

ENV N8N_USER_ID=1000
ENV N8N_PORT=5678
ENV GENERIC_TIMEZONE=Europe/Moscow

EXPOSE 5678

CMD ["n8n", "start"]
