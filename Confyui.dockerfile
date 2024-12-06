FROM ai_stack-build-cuda122:latest

#Create new user
ARG USERNAME=appuser
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

WORKDIR /home/appuser

USER appuser

#Install comfyui
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR /home/appuser/ComfyUI
RUN git checkout v0.3.5
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu122
RUN pip install -r requirements.txt
COPY extra_model_paths.yaml /home/appuser/ComfyUI/

# Define an ARG and ENV
WORKDIR /home/appuser/ComfyUI/custom_nodes
ARG INSTALL_COMFYUI_MANAGER
ENV INSTALL_COMFYUI_MANAGER=${INSTALL_COMFYUI_MANAGER}
RUN if [ "$INSTALL_COMFYUI_MANAGER" = "true" ]; then \
      echo "Installing Extentions..."; \
      git clone https://github.com/ltdrdata/ComfyUI-Manager.git; \
    fi

WORKDIR /home/appuser/ComfyUI
VOLUME /home/appuser/ComfyUI
EXPOSE 8188
ENTRYPOINT [ "python3", "main.py", "--list", "0.0.0.0" ]