#!/bin/bash

# Shell script to activate environment and run the trading bot

# Load environment variables from .env if exists
if [ -f ".env" ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Activate Python virtual environment
if [ -d "venv" ]; then
  source venv/bin/activate
else
  echo "Virtual environment not found. Please create it with: python3 -m venv venv"
  exit 1
fi

# Run the main trading bot script
python3 src/main.py
