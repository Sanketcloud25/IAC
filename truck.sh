#!/bin/bash

# Create www directory in /var
sudo mkdir -p /var/www

# Check if www directory was created successfully
if [ $? -eq 0 ]; then
    echo "Directory /var/www created successfully"
else
    echo "Error creating directory /var/www"
    exit 1
fi

# Change ownership of www directory to current user
sudo chown $(whoami):$(whoami) /var/www

# Create html directory inside www
sudo mkdir -p /var/www/html

# Check if html directory was created successfully
if [ $? -eq 0 ]; then
    echo "Directory /var/www/html created successfully"
else
    echo "Error creating directory /var/www/html"
    exit 1
fi

# Download zip file from URL
wget -P /var/www/html https://www.free-css.com/assets/files/free-css-templates/download/page295/carint.zip

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Downloaded zip file successfully"
else
    echo "Error downloading zip file"
    exit 1
fi

# Unzip the downloaded file
unzip /var/www/html/carint.zip -d /var/www/html

# Check if unzip was successful
if [ $? -eq 0 ]; then
    echo "Unzipped files successfully"
else
    echo "Error unzipping files"
    exit 1
fi

# Move the extracted files to /var/www/html
mv /var/www/html/*/* /var/www/html/

# Check if move was successful
if [ $? -eq 0 ]; then
    echo "Moved files to /var/www/html successfully"
else
    echo "Error moving files to /var/www/html"
    exit 1
fi

# Install Apache HTTP Server
sudo yum install httpd -y

# Check if httpd installation was successful
if [ $? -eq 0 ]; then
    echo "Apache HTTP Server installed successfully"
else
    echo "Error installing Apache HTTP Server"
    exit 1
fi

# Start httpd service
sudo systemctl start httpd

# Check if httpd service started successfully
if [ $? -eq 0 ]; then
    echo "Apache HTTP Server started successfully"
else
    echo "Error starting Apache HTTP Server"
    exit 1
fi
