FROM python:3.7.9-slim-buster

ENV APP_HOME /app
ENV TMP /tmp

WORKDIR ${TMP}

COPY requirements.txt .

RUN python -m venv .venv \
    && . ${TMP}/.venv/bin/activate \
    && pip install -U pip \
    && pip install -r requirements.txt && ls

WORKDIR ${APP_HOME}

COPY src src
COPY main.py .
COPY docker-entrypoint.sh .

ENTRYPOINT [ "/bin/bash" ]

CMD [ "./docker-entrypoint.sh" ]
