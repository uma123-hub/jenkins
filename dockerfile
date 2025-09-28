# Use Nginx previous stable version (example: 1.19)
FROM nginx:latest

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom website files into nginx html directory
COPY ./html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
