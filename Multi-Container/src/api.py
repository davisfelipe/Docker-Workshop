from fastapi import FastAPI
from src.celery import greet

app = FastAPI()


@app.get("/healthcheck")
def healthcheck():
    return {"healthcheck": 200, "hola": "Mundo"}


@app.get("/greet")
def greetings():
    name = "Juan"
    greet.delay(name)
    return {"calling": name}
