FROM python:3.11-slim as builder

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir pdm
RUN pdm install

RUN ls -la /app


FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /app /app

RUN ls -la /app

ENTRYPOINT ["pdm", "run", "bot"]