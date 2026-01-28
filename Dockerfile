FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --no-cache-dir \
    tabpy \
    scipy \
    numpy \
    pandas

RUN mkdir -p /app/config /app/state

COPY tabpy.conf /app/config/tabpy.conf

# Пароль буде створено при старті з ENV змінної
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 9004

CMD ["/app/start.sh"]