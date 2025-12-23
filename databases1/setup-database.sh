#!/bin/bash

# Hotel Management System - Setup Script
# This script sets up PostgreSQL database and initializes the schema

echo "========================================="
echo "Hotel Management System - Database Setup"
echo "========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Database configuration
DB_NAME="Hotel Management"
DB_USER=$(whoami)
DB_PASSWORD="richa123"

# Check if PostgreSQL is installed
if ! command -v psql &> /dev/null; then
    echo -e "${RED}PostgreSQL is not installed!${NC}"
    echo ""
    echo "Installing PostgreSQL via Homebrew..."
    
    if ! command -v brew &> /dev/null; then
        echo -e "${RED}Homebrew is not installed. Please install Homebrew first:${NC}"
        echo "https://brew.sh"
        exit 1
    fi
    
    brew install postgresql@16
    brew services start postgresql@16
    export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
    echo -e "${GREEN}PostgreSQL installed successfully!${NC}"
else
    echo -e "${GREEN}PostgreSQL is already installed.${NC}"
fi

# Check if PostgreSQL is running
if ! pgrep -x postgres > /dev/null; then
    echo ""
    echo "Starting PostgreSQL..."
    brew services start postgresql@16 2>/dev/null || brew services start postgresql 2>/dev/null
    sleep 2
fi

echo ""
echo "Setting up database..."

# Create database if it doesn't exist
if psql -lqt | cut -d \| -f 1 | grep -qw "$DB_NAME"; then
    echo -e "${YELLOW}Database '$DB_NAME' already exists.${NC}"
    read -p "Do you want to drop and recreate it? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        dropdb "$DB_NAME"
        createdb "$DB_NAME"
        echo -e "${GREEN}Database recreated.${NC}"
    fi
else
    createdb "$DB_NAME"
    echo -e "${GREEN}Database '$DB_NAME' created.${NC}"
fi

# Set password for current user
echo ""
echo "Setting up database user..."
psql -d "$DB_NAME" -c "ALTER USER $DB_USER WITH PASSWORD '$DB_PASSWORD';" > /dev/null 2>&1
echo -e "${GREEN}User password set.${NC}"

# Run TABLES.txt to create schema
echo ""
echo "Creating database schema..."
if [ -f "TABLES.txt" ]; then
    psql -d "$DB_NAME" -f TABLES.txt
    echo -e "${GREEN}Schema created successfully!${NC}"
else
    echo -e "${RED}TABLES.txt not found!${NC}"
    exit 1
fi

# Run Insertions.txt to populate data
echo ""
echo "Inserting sample data..."
if [ -f "Insertions.txt" ]; then
    psql -d "$DB_NAME" -f Insertions.txt
    echo -e "${GREEN}Sample data inserted successfully!${NC}"
else
    echo -e "${YELLOW}Insertions.txt not found. Skipping sample data.${NC}"
fi

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}Database setup complete!${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""
echo "Database name: $DB_NAME"
echo "Username: $DB_USER"
echo "Password: $DB_PASSWORD"
echo ""
echo "You can now run the application with: mvn tomcat7:run"
