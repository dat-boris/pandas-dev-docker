FROM continuumio/anaconda3

MAINTAINER boris@techie.im

RUN apt update && apt install -y build-essential && apt clean

COPY pandas /pandas

WORKDIR /pandas
RUN conda env create -f environment.yml

# Keep in the same conda environment
RUN . /opt/conda/etc/profile.d/conda.sh && \
     conda activate pandas-dev && \
     python setup.py build_ext --inplace -j 4 && \
     python -m pip install -e .

RUN . /opt/conda/etc/profile.d/conda.sh && \
     conda activate pandas-dev && \
     pip install ipython==6.5.0
