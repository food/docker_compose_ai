FROM ai_stack-build-cuda118:latest

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
RUN git clone https://github.com/C0untFloyd/roop-unleashed.git
WORKDIR /home/appuser/roop-unleashed
RUN git checkout 4.3.1
RUN pip install -r requirements.txt
RUN pip uninstall onnxruntime onnxruntime-gpu -y
RUN pip install onnxruntime-gpu==1.15.1

# downloading models
# models
WORKDIR /home/appuser/roop-unleashed/models
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/inswapper_128.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/GFPGANv1.4.onnx
RUN wget https://github.com/csxmli2016/DMDNet/releases/download/v1/DMDNet.pth
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/GPEN-BFR-512.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/restoreformer_plus_plus.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/xseg.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/rd64-uni-refined.pth
# CLIP
WORKDIR /home/appuser/roop-unleashed/models/CLIP
RUN  wget https://huggingface.co/countfloyd/deepfake/resolve/main/rd64-uni-refined.pth
# CodeFormer
WORKDIR /home/appuser/roop-unleashed/models/CodeFormer
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/CodeFormerv0.1.onnx
# Frame
WORKDIR /home/appuser/roop-unleashed/models/Frame
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/deoldify_artistic.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/deoldify_stable.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/isnet-general-use.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/real_esrgan_x4.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/real_esrgan_x2.onnx
RUN wget https://huggingface.co/countfloyd/deepfake/resolve/main/lsdir_x4.onnx

#COPY draft/models /home/appuser/roop-unleashed/models

WORKDIR /home/appuser/roop-unleashed
# Create outputs folder
RUN mkdir output

# launching gradio app
ENV GRADIO_SERVER_NAME="0.0.0.0"

VOLUME /home/appuser/roop-unleashed
EXPOSE 7860
ENTRYPOINT [ "python3", "run.py" ]