FROM ubi8/python-39

LABEL maintainer="Richard Walker"

ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 

WORKDIR /opt/app-root/src
COPY . /opt/app-root/src

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

USER root
RUN chown -R 1001:1001 /opt/app-root/src

EXPOSE 8000

USER 1001

CMD python main.py
