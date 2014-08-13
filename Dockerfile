FROM base-sci-app

MAINTAINER Walter Moreira <wmoreira@tacc.utexas.edu>

ENV _APP IPython Notebook
ENV _VERSION 2.1
ENV _LICENSE ___
ENV _AUTHOR ___

ADD intro.txt /docs/ipython/intro.txt
ADD examples.txt /docs/ipython/examples.txt

ADD init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

WORKDIR /root/python/bin
RUN yum install -y gcc gcc-c++
RUN ./pip install pyzmq --install-option="--zmq=bundled" && \
    ./pip install "ipython[notebook]"

EXPOSE 8888
CMD []
