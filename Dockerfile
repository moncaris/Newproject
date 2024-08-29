# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Remove the default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the HTML file to the Nginx server
COPY index.html /usr/share/nginx/html/index.html

# Copy the text file for documentation purposes (optional)
COPY info.txt /usr/share/nginx/html/info.txt

# Expose port 80 to allow external access
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]

