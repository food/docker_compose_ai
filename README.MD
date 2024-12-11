#######################
#    🤹 SERVICES 🤹
#######################
# ✔️ ollama
# ✔️ openweb-ui
# ✔️ stable-deffusion automatic1111 + tools
# ✔️ comfyui INSTALL MANAGER
# 😵‍💫 roop output folder not writable
# 💩 kohya_ss
# 💩 flux-gym
# 💩 wd-llm-caption-cli
# 💩 tensorboard
# 💩 stable-diffusion-webui-forge
# wd-llm-caption-cli for better image captions
# text to speach /whisper / piper
# speach to text
# jupyter   docker run -d -p 8888:8888 --gpus all --name jupxter quay.io/jupyter/pytorch-notebook:cuda12-python-3.11.8
# home assistant support
#######################


#######################
#######################
## Prestuff on host required:
# curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
#  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
# sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
# sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
# sudo apt update
# sudo apt install -y nvidia-container-toolkit
#######################
## Configure NVIDIA Container Toolkit
# sudo nvidia-ctk runtime configure --runtime=docker
# sudo systemctl restart docker
#######################
## Test GPU integration
# docker run --gpus all nvidia/cuda:11.5.2-base-ubuntu20.04 nvidia-smi
#######################
#######################
# Using models
# llama3.2:latest
# (llama3.2-vision:latest)
# qwen2.5-coder:latest
# ?? nemotron: ??
# phi3.5:latest
# llava:latest
# nomic-embed-text:latest
# deepseek-coder-v2:latest
# stable-code:latest
# starcoder2:latest
# (codellama:latest)
# codestral:latest
# llama3:70b
# llama3
# (deepseek-v2:latest)
# (blackhat-hacker:latest)
# (whiterabbitneo:latest )
# orca-mini:latest
# (brxce/stable-diffusion-prompt-generator:latest)
#######################
#######################