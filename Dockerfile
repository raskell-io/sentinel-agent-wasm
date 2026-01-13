# syntax=docker/dockerfile:1.4

# Sentinel WASM Agent Container Image
#
# Targets:
#   - prebuilt: For CI with pre-built binaries

################################################################################
# Pre-built binary stage (for CI builds)
################################################################################
FROM gcr.io/distroless/cc-debian12:nonroot AS prebuilt

COPY sentinel-wasm-agent /sentinel-wasm-agent

LABEL org.opencontainers.image.title="Sentinel WASM Agent" \
      org.opencontainers.image.description="Sentinel WASM Agent for Sentinel reverse proxy" \
      org.opencontainers.image.vendor="Raskell" \
      org.opencontainers.image.source="https://github.com/raskell-io/sentinel-agent-wasm"

ENV RUST_LOG=info,sentinel_wasm_agent=debug \
    SOCKET_PATH=/var/run/sentinel/wasm.sock

USER nonroot:nonroot

ENTRYPOINT ["/sentinel-wasm-agent"]
