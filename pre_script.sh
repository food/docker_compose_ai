#!/bin/bash

# Load the .env file
set -a                  # Automatically export all variables
source .env             # Source the .env file
set +a                  # Disable automatic export

# Use the variables
echo "Create required pathes"
# LLMs
mkdir -p "$BASE_PATH$OPENWEBUI_PATH_TO_DATA"
mkdir -p "$BASE_PATH$OLLAMA_PATH_TO_DATA"
# Automatic1111
mkdir -p "$BASE_PATH$AUTOMATIC_PATH_TO_OUTPUTS"
mkdir -p "$BASE_PATH$AUTOMATIC_PATH_TO_MODELS"
mkdir -p "$BASE_PATH$AUTOMATIC_PATH_TO_EMBEDDINGS"
mkdir -p "$BASE_PATH$AUTOMATIC_PATH_TO_EXTENTIONS"
mkdir -p "$BASE_PATH$INSTALL_AUTOMATIC_EXTENTIONS"
#ComfyUi
mkdir -p "$BASE_PATH$COMFYUI_PATH_TO_OUTPUTS"
mkdir -p "$BASE_PATH$COMFYUI_PATH_TO_MODELS"
mkdir -p "$BASE_PATH$COMFYUI_PATH_TO_EXTENTIONS"
# roop
mkdir -p "$BASE_PATH$ROOP_PATH_TO_OUTPUTS"