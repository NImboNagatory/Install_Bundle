#!/bin/bash

echo "Installation Started"
sleep 2

# Function for checking command success
check_command() {
    if [ $? -eq 0 ]; then
        echo "$1 installed successfully"
    else
        echo "Error: $1 installation failed"
        exit 1
    fi
}

# Check if Docker is already installed
docker --version &> /dev/null
if [ $? -eq 0 ]; then
    echo "Docker is already installed"
else
    sudo sh ./bundle/installdocker.sh
    check_command "Docker"
fi

sudo sh ./bundle/installkubernates.sh
check_command "kubectl"

sudo sh ./bundle/installhelm.sh
check_command "Helm"

sudo sh ./bundle/installminikube.sh
check_command "Minikube"

sudo sh ./bundle/grafanaandprometheus.sh

echo "Installation complete"
sleep 2

