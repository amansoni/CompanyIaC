#!/bin/bash

# --- UFW Configuration Script ---

# 1. Allow incoming SSH (port 22)
echo "Allowing SSH (port 22)..."
sudo ufw allow ssh

# 2. Allow incoming HTTP (port 80)
echo "Allowing HTTP (port 80)..."
sudo ufw allow http

# 3. Allow incoming HTTPS (port 443)
echo "Allowing HTTPS (port 443)..."
sudo ufw allow https

# 4. Enable UFW and confirm the operation
read -r -p "Do you want to enable the firewall now? This will activate the rules. (y/n): " response

if [[ "$response" =~ ^([yY])$ ]]
then
    echo "Enabling UFW..."
    sudo ufw enable
    echo ""
    echo "UFW is now active. Current status:"
    sudo ufw status verbose
else
    echo "UFW remains disabled. To enable later, run 'sudo ufw enable'."
    echo "Current rules (inactive):"
    sudo ufw status verbose
fi