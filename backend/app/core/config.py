from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    PROJECT_NAME: str = "UrbanFlow OS"
    API_V1_STR: str = "/api/v1"
    
    # Supabase / Postgres
    SUPABASE_URL: str
    SUPABASE_KEY: str
    DATABASE_URL: str  # postgresql+asyncpg://user:pass@host:port/dbname
    
    # Redis
    REDIS_URL: str = "redis://localhost:6379"
    
    # Security
    SECRET_KEY: str = "YOUR_SECRET_KEY"
    ALGORITHM: str = "HS256"

    class Config:
        case_sensitive = True
        env_file = ".env"

settings = Settings()
