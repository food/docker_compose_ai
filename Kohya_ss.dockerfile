FROM ai_stack-build-cuda122:latest

RUN apt install -y python3-tk

#USER appuser
#Install comfyui
RUN mkdir /app
WORKDIR /app/
RUN git clone https://github.com/bmaltais/kohya_ss.git
WORKDIR /app/kohya_ss
RUN git checkout sd3-flux.1
RUN chmod +x ./setup.sh
RUN ./setup.sh

VOLUME /app/kohya_ss
EXPOSE 7860
ENTRYPOINT [ "./gui.sh", "--listen", "0.0.0.0", "--server_port", "7860", "--headless"]