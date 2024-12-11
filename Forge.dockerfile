FROM docker_compose_ai-build-cuda122:latest

#Create new user
ARG USERNAME=appuser
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

WORKDIR /home/appuser

USER appuser

#Install forge
RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git forge
WORKDIR /home/appuser/forge
RUN chmod +x ./webui-user.sh
RUN ./webui-user.sh
ADD webui-user.sh .

WORKDIR /home/appuser/forge
VOLUME /home/appuser/forge
EXPOSE 7860
ENTRYPOINT [ "./webui.sh" ]