FROM python:3.7.9-slim-buster

ENV APP_HOME /app
ENV VENV /opt
ENV TMP /tmp

WORKDIR ${TMP}

COPY requirements.txt .

RUN pip install httpie \
    && python -m venv ${VENV}/.venv \
    && . ${VENV}/.venv/bin/activate \
    && pip install -U pip \
    && pip install -r requirements.txt

WORKDIR ${APP_HOME}

COPY src src
COPY docker-entrypoint.sh .
COPY main.py .

HEALTHCHECK --timeout=10s --retries=1 --interval=10s CMD HEALTHCHECK=true ./docker-entrypoint.sh

ENTRYPOINT [ "/bin/bash" ]

CMD [ "./docker-entrypoint.sh" ]
