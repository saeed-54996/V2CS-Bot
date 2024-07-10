#!/bin/bash

# Function to install necessary dependencies
install_dependencies() {
    echo "Installing necessary dependencies..."
    if command -v apt-get > /dev/null; then
        sudo apt-get update
        sudo apt-get install -y php php-cli git
    elif command -v yum > /dev/null; then
        sudo yum install -y epel-release
        sudo yum install -y php php-cli git
    else
        echo "Package manager not supported. Please install PHP and Git manually."
        exit 1
    fi
}

# Function to clone the repository
clone_repository() {
    echo "Cloning the repository..."
    git clone https://github.com/saeed-54996/V2CS-Bot V2CS
}

# Function to start PHP built-in server
start_php_server() {
    echo "Starting PHP built-in server on port 4552..."
    cd V2CS
    php -S 0.0.0.0:4552 index.php &
}

# Main function to execute the script
main() {
    install_dependencies
    clone_repository
    start_php_server
    echo "The PHP file is reachable on port 4552"
}

# Execute main function
main
