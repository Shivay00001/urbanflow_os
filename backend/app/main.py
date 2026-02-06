from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.config import settings
# from app.api.v1.api import api_router # TODO: Create router

app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
    description="Real-time Urban Infrastructure Platform"
)

# CORS - Allow all for now, restrict in production
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"message": "Welcome to UrbanFlow OS Backend"}

@app.get("/health")
def health_check():
    return {"status": "ok"}

# app.include_router(api_router, prefix=settings.API_V1_STR)
