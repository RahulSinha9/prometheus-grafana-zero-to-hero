# Prometheus Installation

## 🎯 Goal
Run a working Prometheus instance and verify that it can scrape itself and external targets.

## Prerequisites
- Linux/macOS/Windows with Docker for the lab path.
- Basic YAML knowledge.
- Port `9090` available.

## Docker lab

```yaml
services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml:ro
```

Start it with `docker compose up -d` and open the Prometheus UI.

## Native installation concepts
Learn the difference between downloading a release binary, configuring a service, managing its data directory, and exposing the web interface securely.

## First verification
Run:

```promql
up
prometheus_build_info
```

Confirm the Prometheus self-target is healthy.

## Operational checks
- Check process/container status.
- Check listening port.
- Check configuration syntax.
- Read startup logs.
- Confirm the target page shows `UP`.
- Confirm queries return recent samples.

## 🧪 Failure lab
Intentionally introduce an invalid configuration, observe startup failure, correct it, restart, and verify recovery.

## ✅ Completion
- [ ] Start Prometheus.
- [ ] Open the UI.
- [ ] Query `up`.
- [ ] Inspect logs.
- [ ] Recover from a configuration error.