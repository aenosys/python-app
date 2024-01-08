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

# Expose a port that your application may use (you can change this to match your application)
EXPOSE 5000

# Define the command to run your Python application
CMD ["python", "app.py"]
