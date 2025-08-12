FROM node:18-bullseye-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg python3 build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install n8n globally
RUN npm install -g n8n

# Switch to the existing 'node' user
USER node
WORKDIR /home/node

# Expose n8n default port
EXPOSE 5678

# Railway uses PORT env variable, so map it
ENV N8N_PORT=${PORT:-5678}
ENV N8N_HOST=0.0.0.0

CMD ["n8n", "start"]
