# Use a Python base image with your desired Python version (e.g., python:3.8)
FROM python:3.8

# Set the working directory within the container
WORKDIR /app

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the rest of your Python application code to the working directory
COPY . .

# Install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Remove default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Add Nginx configuration directly in Dockerfile
RUN echo 'server {\n\
    listen 80;\n\
    location / {\n\
        proxy_pass http://127.0.0.1:5000;\n\
        proxy_set_header Host $host;\n\
        proxy_set_header X-Real-IP $remote_addr;\n\
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\
    }\n\
    access_log /dev/stdout;\n\
    error_log /dev/stderr;\n\
}' > /etc/nginx/sites-enabled/default

# Expose ports for both Nginx and the Python app
EXPOSE 80 5000

# Start both Nginx and the application, keeping both in the foreground
CMD service nginx start && tail -F /var/log/nginx/access.log /var/log/nginx/error.log & python app.py
