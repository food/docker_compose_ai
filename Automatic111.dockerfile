FROM ai_stack-build-cuda122:latest

#Create new user
ARG USERNAME=appuser
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

WORKDIR /home/appuser

USER $USERNAME

# Install automatic1111
RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
RUN chmod +x ./webui.sh
RUN ./webui.sh
WORKDIR /home/appuser/stable-diffusion-webui
ADD webui-user.sh .
RUN pip install -r requirements.txt
# Create outputs folder
RUN mkdir outputs

WORKDIR /home/appuser/stable-diffusion-webui/extensions
ADD automatic_extentions.sh .
# Install extentions
# Define an ARG and ENV
ARG INSTALL_AUTOMATIC_EXTENTIONS
ENV INSTALL_AUTOMATIC_EXTENTIONS=${INSTALL_AUTOMATIC_EXTENTIONS}
RUN if [ "$INSTALL_AUTOMATIC_EXTENTIONS" = "true" ]; then \
      echo "Installing Extentions..."; \
      /bin/bash automatic_extentions.sh; \
    fi

WORKDIR /home/appuser/stable-diffusion-webui
VOLUME /home/appuser/stable-diffusion-webui
EXPOSE 7860
ENTRYPOINT [ "./webui.sh" ]
