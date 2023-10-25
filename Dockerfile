# Use a lightweight Ubuntu base image
FROM ubuntu:20.04

# Set the terminal to use the user 'root' initially
USER root

# Install Python, SQLite3, Node.js, and other necessary packages
RUN apt-get update && apt-get install -y \
    tree \
    python3 \
    python3-pip \
    sqlite3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Set the command line prompt to show the current working folder
#RUN echo 'export PS1="\w$ "' >> /root/.bashrc

# Create a new user 'hsewdd'
RUN useradd -m -s /bin/bash hsewdd

# Switch to the 'hsewdd' user
USER hsewdd

# Set the command line prompt to show the current working folder
RUN echo 'export PS1="\w$ "' >> /home/hsewdd/.bashrc

# Install Flask using pip
RUN pip3 install Flask

# Expose a port if needed for your Flask application (e.g., 5000)
# EXPOSE 5000

# Set the working directory for the 'hsewdd' user
RUN mkdir /home/hsewdd/app
WORKDIR /home/hsewdd/app

# Start your application, replace this with your actual command
# CMD ["python3", "app.py"]
