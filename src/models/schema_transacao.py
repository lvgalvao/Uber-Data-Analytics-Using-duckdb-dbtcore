from pydantic import BaseModel
from datetime import datetime

class SchemaTabelaTransacao(BaseModel):
    venda: int
    data_collection: datetime