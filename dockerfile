FROM python:3.14-slim AS builder
RUN apt-get update -y && apt-get install -y --no-install-recommends gcc python3-dev && rm -rf /var/lib/apt/lists/*
RUN pip3 install --no-cache-dir --target=/install honeypots "cryptography<42"

FROM python:3.14-slim
COPY --from=builder /install /usr/local/lib/python3.12/site-packages
WORKDIR /honeypots
VOLUME /honeypots
COPY config.json .
ENTRYPOINT ["python3","-W","ignore::DeprecationWarning","-m","honeypots","--config","config.json"]
