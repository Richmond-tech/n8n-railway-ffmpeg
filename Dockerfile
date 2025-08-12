FROM node:18-bullseye-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg python3 build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install a stable n8n version
RUN npm install -g n8n@0.236.3

# Use the existing 'node' user
USER node
WORKDIR /home/node

# Expose port
EXPOSE 5678

# Environment variables
ENV N8N_PORT=${PORT:-5678}
ENV N8N_HOST=0.0.0.0
ENV N8N_EDITOR_BASE_URL=http://0.0.0.0:${PORT:-5678}

# Start n8n
CMD ["n8n", "start"]
