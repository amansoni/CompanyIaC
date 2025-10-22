from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from typing import List

app = FastAPI(title="Galea Care API", description="Multi-tenant mental health risk assessment API.")

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/auth/realms/galea-care/protocol/openid-connect/token")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/assessments")
def get_assessments(token: str = Depends(oauth2_scheme)):
    # TODO: Validate JWT, extract organization_id, role, and filter data
    return [{"id": 1, "score": 5, "risk_level": "low"}]

@app.get("/users")
def get_users(token: str = Depends(oauth2_scheme)):
    # TODO: RBAC enforcement, organization isolation
    return [{"id": 1, "role": "therapist", "organization_id": 1}]
