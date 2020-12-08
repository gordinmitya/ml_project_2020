FROM tensorflow/tensorflow:latest-gpu

WORKDIR /ml_project/

RUN apt update && apt install -y wget && \
    wget --progress=bar:force:noscroll -nc http://ml_course.gordinmitya.ru/modified_public.zip && \
    unzip -o modified_public.zip && \
    rm modified_public.zip && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN pip install \
    numpy \
    keras \
    jupyterlab  \
    opencv-python \
    sklearn \
    matplotlib \
    pandas

CMD jupyter-lab . --allow-root --ip 0.0.0.0 --port 8080