#!/bin/bash

. "$VENV"/.venv/bin/activate;

# Set Default Port and Host in Dockerfile

if [ -z "${PORT}" ] ; then PORT=8080; fi

if [ -z "${HOST}" ] ; then HOST=0.0.0.0; fi

uvicorn main:app --host $HOST --port $PORT
