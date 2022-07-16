FROM nvidia/cuda:11.3.1-runtime-ubuntu20.04


RUN mkdir /app
COPY ./requirements.txt /app/requirements.txt
COPY ./main.py /app/main.py

WORKDIR /app

# Fix for open-cv install issues
RUN apt update && apt upgrade -y
RUN apt install ffmpeg libsm6 libxext6  -y

# Install python 3,10
RUN apt install software-properties-common -y
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt update
RUN  DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y python3.10 python3.10-distutils curl
# Install pip for python 3.10. Only way to get pip works properly
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Update pip
# RUN /usr/local/bin/python3 -m pip install --upgrade pip

RUN pip install -r requirements.txt

RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

ENV CUDA_LAUNCH_BLOCKING=1