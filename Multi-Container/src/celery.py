from os import environ

from celery import Celery


app = Celery(
    'tasks',
    broker=environ.get('RABBITMQ_HOST')
)


@app.task(name='greetings')
def greet(name: str):
    return f'hello {name}'
