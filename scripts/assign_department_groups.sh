#!/bin/bash

# IT
sudo usermod -aG IT john
sudo usermod -aG IT mary
sudo usermod -aG IT alex

# HR
sudo usermod -aG HR susan
sudo usermod -aG HR linda

# Finance
sudo usermod -aG Finance peter
sudo usermod -aG Finance jane

# Management
sudo usermod -aG Management ceo
sudo usermod -aG Management manager

echo "Users assigned to department groups successfully."

