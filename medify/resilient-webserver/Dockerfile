# BUILDER STAGE
FROM python:3.11-slim AS builder
WORKDIR /app
COPY src/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

#RUNTIME STAGE
FROM python:3.11-alpine
WORKDIR /app
COPY --from=builder /install /usr/local
COPY src/app.py .
EXPOSE 3000
CMD ["python", "app.py"]