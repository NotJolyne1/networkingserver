#!/bin/sh
set -eu
# The provided compiled server starts its WebSocket/HTTP listener on 8080.
# Render forwards HTTPS/WebSockets to the public $PORT; relay TCP to 8080.
PORT="${PORT:-10000}"
case "$PORT" in *[!0-9]*|'') echo 'Invalid PORT' >&2; exit 1;; esac
if [ "$PORT" = "8080" ]; then
  exec dotnet /app/RelayNetworking.Server.dll
fi
socat "TCP-LISTEN:${PORT},bind=0.0.0.0,reuseaddr,fork" TCP:127.0.0.1:8080 &
PROXY_PID=$!
dotnet /app/RelayNetworking.Server.dll &
SERVER_PID=$!
cleanup() { kill "$SERVER_PID" "$PROXY_PID" 2>/dev/null || true; }
trap cleanup EXIT INT TERM
wait "$SERVER_PID"
