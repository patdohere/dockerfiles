FROM jupyter/notebook
MAINTAINER patdohere

RUN apt-get update && apt-get install -y \
    python-matplotlib

RUN pip install --upgrade pip
RUN python -m pip install --upgrade pip

COPY run.sh /home/run.sh

ENV DATO_USERNAME=""
ENV DATO_PRODUCT_KEY=""

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888
ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/home/run.sh"]
