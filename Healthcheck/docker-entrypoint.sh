#!/bin/bash

. "$VENV"/.venv/bin/activate;

# Set Default Port and Host in Dockerfile

if [ -z "${PORT}" ] ; then PORT=8080; fi

if [ -z "${HOST}" ] ; then HOST=0.0.0.0; fi

if [ "${HEALTHCHECK}" = true ];
then
    exit 0
else
    uvicorn main:app --host $HOST --port $PORT
fi
