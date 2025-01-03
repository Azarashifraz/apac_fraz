#!/bin/bash

# Colors for enhanced text display
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display the main menu creatively
show_main_menu() {
    clear

    # Display a banner with color and ASCII art
    echo -e "${BLUE}###############################"
    echo -e "# ${GREEN}Apache Management Script${NC}     #"
    echo -e "# ${YELLOW}By thegodfraz@gmail.com${NC}      #"
    echo -e "###############################"
    echo
    echo -e "${YELLOW}Welcome to Apache Management!${NC}"
    echo -e "Select an option below to manage your Apache server."
    echo

    # Use ASCII art or symbols for decoration
    echo -e "${GREEN}[1]${NC} --> ${YELLOW}Start Apache${NC}"
    echo -e "${GREEN}[2]${NC} --> ${YELLOW}Status Apache${NC}"
    echo -e "${GREEN}[3]${NC} --> ${YELLOW}Restart Apache${NC}"
    echo -e "${GREEN}[4]${NC} --> ${YELLOW}File Management${NC}"
    echo -e "${GREEN}[5]${NC} --> ${YELLOW}Stop Apache${NC}"
    echo -e "${GREEN}[6]${NC} --> ${YELLOW}Exit Script${NC}"
    echo
}

# Function to start Apache
start_apache() {
    clear
    echo "Starting Apache server..."
    sudo service apache2 start
    if [ $? -eq 0 ]; then
        echo "Apache started successfully."
    else
        echo "Error starting Apache."
    fi
}

# Function to show Apache status
status_apache() {
    clear
    sudo service apache2 status
    read -p "Press Enter to return to the menu..."
}

# Function to restart Apache
restart_apache() {
    clear
    echo "Restarting Apache server..."
    sudo service apache2 restart
    if [ $? -eq 0 ]; then
        echo "Apache restarted successfully."
    else
        echo "Error restarting Apache."
    fi
}

# Function for file management
file_management() {
    clear
    echo "--------------------------"
    echo "--- File Management Menu ---"
    echo "[1] --> Rename File"
    echo "[2] --> Copy File"
    echo "[3] --> Move File"
    echo "[4] --> Back to Main Menu"
    echo

    read -p "Choose a file management option: " file_choice

    case $file_choice in
        1|01)
            rename_file
            ;;
        2|02)
            copy_file
            ;;
        3|03)
            move_file
            ;;
        4|04)
            return
            ;;
        *)
            echo "Unknown selection. Returning to file management menu..."
            file_management
            ;;
    esac
}

# Function to rename a file
rename_file() {
    clear
    read -p "Enter the current file path: " old_file
    read -p "Enter the new file name: " new_file
    if [ -e "$old_file" ]; then
        mv "$old_file" "$new_file"
        if [ $? -eq 0 ]; then
            echo "File renamed successfully."
        else
            echo "Error renaming the file."
        fi
    else
        echo "The file does not exist."
    fi
}

# Function to copy a file
copy_file() {
    clear
    read -p "Enter the file path to copy: " file_to_copy
    read -p "Enter the destination path: " dest_path
    if [ -e "$file_to_copy" ]; then
        cp "$file_to_copy" "$dest_path"
        if [ $? -eq 0 ]; then
            echo "File copied successfully."
        else
            echo "Error copying the file."
        fi
    else
        echo "The file does not exist."
    fi
}

# Function to move a file
move_file() {
    clear
    read -p "Enter the file path to move: " file_to_move
    read -p "Enter the destination path: " move_dest
    if [ -e "$file_to_move" ]; then
        mv "$file_to_move" "$move_dest"
        if [ $? -eq 0 ]; then
            echo "File moved successfully."
        else
            echo "Error moving the file."
        fi
    else
        echo "The file does not exist."
    fi
}

# Function to stop Apache
stop_apache() {
    clear
    echo "Stopping Apache server..."
    sudo service apache2 stop
    if [ $? -eq 0 ]; then
        echo "Apache stopped successfully."
    else
        echo "Error stopping Apache."
    fi
}

# Main function to handle the menu options
main_menu() {
    show_main_menu
    read -p "Choose an option: " menu

    case $menu in
        1|01)
            start_apache
            ;;
        2|02)
            status_apache
            ;;
        3|03)
            restart_apache
            ;;
        4|04)
            file_management
            ;;
        5|05)
            stop_apache
            ;;
        6|06)
            clear
            echo "Exiting the script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Unknown selection. Returning to main menu..."
            main_menu
            ;;
    esac
}

# Run the main menu in a loop until the user exits
while true; do
    main_menu
done

#Version 2
#Created by azarashifraz, Fraz nickname
