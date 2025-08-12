FROM n8nio/n8n:latest

# Install FFmpeg
USER root
RUN apk add --no-cache ffmpeg

# Switch back to n8n user
USER node

# Expose default port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
