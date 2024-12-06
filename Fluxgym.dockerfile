FROM ai_stack-build-cuda122:latest

#Install comfyui
RUN mkdir /app
WORKDIR /app/
RUN git clone https://github.com/cocktailpeanut/fluxgym
WORKDIR /app/fluxgym
RUN git clone -b sd3 https://github.com/kohya-ss/sd-scripts
WORKDIR /app/fluxgym/sd-scripts
RUN pip install -r requirements.txt
WORKDIR /app/fluxgym
RUN pip install -r requirements.txt

RUN pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# launching gradio app
ENV GRADIO_SERVER_NAME="0.0.0.0"

VOLUME /app/fluxgym
EXPOSE 7860
ENTRYPOINT [ "python", "app.py"]