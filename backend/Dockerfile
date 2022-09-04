FROM python:3.10-buster

RUN mkdir app
WORKDIR /app

ENV PATH="${PATH}:/root/.local/bin"
ENV PYTHONPATH=.

COPY poetry.lock .
COPY pyproject.toml .
RUN pip install --upgrade pip
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install

COPY src/ .
CMD ["poetry", "run", "uvicorn", "src.main:app", "--reload", "--host", "0.0.0.0", "--port", "5335"]
