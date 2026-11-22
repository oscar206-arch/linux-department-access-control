#!/bin/bash

# Configure directory ownership

sudo chown root:IT /company/IT
sudo chown root:HR /company/HR
sudo chown root:Finance /company/Finance
sudo chown root:Management /company/Management

# Configure permissions

sudo chmod 770 /company/IT
sudo chmod 770 /company/HR
sudo chmod 770 /company/Finance
sudo chmod 770 /company/Management

# Enable SGID

sudo chmod g+s /company/IT
sudo chmod g+s /company/HR
sudo chmod g+s /company/Finance
sudo chmod g+s /company/Management

echo "Ownership and permissions configured successfully"


