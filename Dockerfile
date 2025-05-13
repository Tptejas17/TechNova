# Use an Nginx base image to serve static files
FROM nginx:alpine

# Copy your HTML and CSS files into Nginx's public directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Nginx runs automatically, so no need for CMD
