#!/bin/bash

# Colors for enhanced text display
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# GitHub repository details
GITHUB_REPO="https://github.com/Azarashifraz/apac_fraz.git"
CLONE_DIR="apac_fraz"

# Function to check if a command exists
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo -e "${RED}Error: $1 is not installed.${NC}"
        return 1
    else
        echo -e "${GREEN}$1 is installed.${NC}"
        return 0
    fi
}

# Function to check if the script is run with sudo or root privileges
check_sudo() {
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "${RED}Error: This script requires sudo or root privileges to run.${NC}"
        exit 1
    else
        echo -e "${GREEN}Sudo/root privileges confirmed.${NC}"
    fi
}

# Function to check if Apache is installed
check_apache() {
    if dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -q "install ok installed"; then
        echo -e "${GREEN}Apache is installed.${NC}"
    else
        echo -e "${YELLOW}Apache is not installed. Attempting to install...${NC}"
        sudo apt-get update && sudo apt-get install -y apache2
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Apache has been installed successfully.${NC}"
        else
            echo -e "${RED}Failed to install Apache. Please install it manually.${NC}"
            exit 1
        fi
    fi
}

# Function to check write permissions for the current directory
check_write_permissions() {
    if [ -w "$(pwd)" ]; then
        echo -e "${GREEN}Write permissions are available for the current directory.${NC}"
    else
        echo -e "${RED}Error: Write permissions are not available for the current directory.${NC}"
        exit 1
    fi
}

# Function to update the script from GitHub
update_from_github() {
    echo -e "${YELLOW}Checking for updates from GitHub...${NC}"
    if check_command "git"; then
        if [ -d "$CLONE_DIR" ]; then
            echo -e "${YELLOW}Directory '$CLONE_DIR' exists. Pulling latest changes...${NC}"
            cd "$CLONE_DIR" && git pull
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}Updated successfully.${NC}"
            else
                echo -e "${RED}Failed to pull updates. Please check your GitHub repository.${NC}"
            fi
            cd ..
        else
            echo -e "${YELLOW}Cloning repository from $GITHUB_REPO...${NC}"
            git clone "$GITHUB_REPO"
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}Repository cloned successfully.${NC}"
            else
                echo -e "${RED}Failed to clone the repository. Please check the URL.${NC}"
            fi
        fi
    else
        echo -e "${RED}Git is not installed. Please install Git to enable auto-updates.${NC}"
    fi
}

# Main function to run all checks
run_checks() {
    echo -e "${YELLOW}Checking system requirements...${NC}"
    check_sudo
    check_command "bash"
    check_command "sudo"
    check_command "mv"
    check_command "cp"
    check_command "service"
    check_command "git"
    check_apache
    check_write_permissions

    echo -e "${YELLOW}Would you like to update the Apache Management Script from GitHub?${NC}"
    read -p "Enter Y to update or N to skip: " update_choice
    case "$update_choice" in
        Y|y)
            update_from_github
            ;;
        N|n)
            echo -e "${GREEN}Skipping GitHub update.${NC}"
            ;;
        *)
            echo -e "${RED}Invalid input. Skipping update.${NC}"
            ;;
    esac

    echo -e "${GREEN}All requirements are met. You can run the Apache Management Script now.${NC}"
}

# Run the checks
run_checks
