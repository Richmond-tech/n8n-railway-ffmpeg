FROM n8nio/n8n:latest

# Switch to root to install ffmpeg
USER root

# Update package lists and install ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# Restore n8n user
USER node

# Expose the default port
EXPOSE 5678

# Start n8n when container launches
CMD ["n8n"]
