FROM mcr.microsoft.com/dotnet/runtime:8.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends socat \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY app/ ./
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENV PORT=10000
EXPOSE 10000
ENTRYPOINT ["/start.sh"]
