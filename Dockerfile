FROM python:3.12
# Instalando o Poetry
RUN pip install poetry

# Copiar o conteúdo do diretório atual para o contêiner
COPY . /src

# Definir o diretório de trabalho
WORKDIR /src

# Instalar as dependencias do projeto com Poetry
RUN poetry install

# Expor a porta em que a aplicaçao estará escutando
EXPOSE 8501

# Definir o entrypoint para executar o servidor
ENTRYPOINT [ "poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8501" ]