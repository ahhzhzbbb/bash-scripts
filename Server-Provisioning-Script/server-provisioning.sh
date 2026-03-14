#!/bin/bash

USER_NAME="deploy"
PROJECT_DIR="/home/${USER_NAME}/"

if [[ -z "$1" ]]; then
    echo "Usage: $0 + <project_url>"
    exit 1
fi

PROJECT_NAME=$(basename "$1" .git)

echo "========================================Hoangmp========================================"
echo "---------------------------------------------------------------------------------------"
echo "os version: $(uname -a)"
echo "uptime: $(w)"
echo "---------------------------------------------------------------------------------------"

echo ""

#Step1: Update system
echo "Updating system..."
sudo apt update > /dev/null

if [[ "$?" -ne 0 ]]; then
    echo "failed to update your system"
    exit 1
fi

#Step2: Install packages
echo "Installing packages..."
sudo apt install -y docker.io docker-compose-plugin nginx git ufw > /dev/null

if [[ "$?" -ne 0 ]]; then
    echo "failed to install packages"
    exit 1
fi

#Step3: Setup firewall

echo "Setting up firewall..."

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443

sudo ufw --force enable

echo "Firewall configured"

#Step4: Create deploy user
echo "Checking deploy user..."
if id "$USER_NAME" &>/dev/null; then
    echo "User already exists"
else
    sudo adduser --disabled-password --gecos "" "$USER_NAME"
    sudo usermod -aG docker "$USER_NAME"
    if [[ "$?" -ne 0 ]]; then
        echo "failed to create new user"
        exit 1
    fi
fi

#Step5: Clone project
echo "Cloning project..."

git ls-remote "$1" > /dev/null 2>&1

if [[ "$?" -ne 0 ]]; then
    echo "this repo is not exist"
    exit 1
fi

cd "$PROJECT_DIR"
if [[ ! -d "$PROJECT_NAME" ]]; then
    git clone "$1" > /dev/null
fi

if [[ "$?" -ne 0 ]]; then
    echo "failed to clone the project"
    exit 1
fi

cd "$PROJECT_NAME"
git pull
#Step6: Start container
echo "Starting containers..."

if [[ ! -f docker-compose.yml && ! -f compose.yaml ]]; then
    echo "docker compose file not found"
    exit 1
fi

docker compose up -d

if [[ "$?" -ne 0 ]]; then
    echo "failed to start container"
    exit 1
fi

echo "Deployment successful"