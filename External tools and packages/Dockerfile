FROM python:3.7.9-slim-buster

ENV APP_HOME /app
ENV VENV /opt
ENV TMP /tmp

WORKDIR ${TMP}

COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget xfonts-base xfonts-75dpi libxrender1 libxext6 libxcb1 libpng16-16 libjpeg62-turbo libfreetype6 fontconfig\
    && wget "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb" \
    && dpkg -i wkhtmltox_0.12.6-1.buster_amd64.deb \
    && python -m venv ${VENV}/.venv \
    && . ${VENV}/.venv/bin/activate \
    && pip install -U pip \
    && pip install -r requirements.txt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists \
    && rm -rf *

COPY src src
COPY docker-entrypoint.sh .
COPY main.py .

ENTRYPOINT [ "/bin/bash" ]

CMD [ "./docker-entrypoint.sh" ]
