# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application source code
COPY . .

# Make port 4499 available. This is the correct port for the app.
EXPOSE 4499

# Define environment variable
ENV NAME Wisecow

# Run app.py when the container launches
CMD ["python", "app.py"]