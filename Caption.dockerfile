FROM ai_stack-build-cuda122:latest

#Create new user
ARG USERNAME=appuser
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
    #&& echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    #&& chmod 0440 /etc/sudoers.d/$USERNAME

WORKDIR /home/appuser

USER appuser

#Install comfyui
RUN mkdir /home/appuser/wd-llm-caption-cli
WORKDIR /home/appuser/wd-llm-caption-cli

# Install torch base on your GPU driver. e.g.
RUN pip install torch==2.5.0 --index-url https://download.pytorch.org/whl/cu124
# Install via pip from pypi
RUN pip install wd-llm-caption
# For CUDA 12.X
RUN wget --content-disposition https://raw.githubusercontent.com/fireicewolf/wd-llm-caption-cli/refs/tags/v0.1.4-alpha/requirements_onnx_cu12x.txt
RUN pip install -U -r requirements_onnx_cu12x.txt

VOLUME /home/appuser/wd-llm-caption-cli
EXPOSE 8282
ENTRYPOINT [ "wd-llm-caption-gui", "--listen"]