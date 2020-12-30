#!/bin/bash

. $TMP/.venv/bin/activate;

# Set Default Port and Host in Dockerfile

if [ -z "${PORT}" ] ; then PORT=8080; fi

if [ -z "${HOST}" ] ; then HOST=0.0.0.0; fi


if [ "${CELERY}" = true ];
then
    celery -A src.celery worker --loglevel=info
else
    uvicorn main:app --host $HOST --port $PORT
fi
