from fastapi import FastAPI

app = FastAPI(title="ValueInvest API")


@app.get("/healthz")
def healthz() -> dict:
    """GET /healthz"""
    return {"ok": True}
