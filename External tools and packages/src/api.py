from fastapi import FastAPI

app = FastAPI()


@app.get("/healthceck")
def healthcheck():
    return {"healthcheck": 200, "hello": "world"}
