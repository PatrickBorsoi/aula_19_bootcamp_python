# Usar a imagem oficial do Python 3.12
FROM python:3.12

# Instalar Poetry corretamente
RUN pip install poetry

# Definir diretório de trabalho
WORKDIR /src

# Copiar arquivos de dependências primeiro (otimiza cache)
COPY pyproject.toml poetry.lock ./

# Instalar dependências do projeto
RUN poetry install --no-root

# Copiar restante do código
COPY . .

# Expor a porta 8501
EXPOSE 8501

# Definir entrypoint para rodar o FastAPI com uvicorn
ENTRYPOINT ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8501"]
