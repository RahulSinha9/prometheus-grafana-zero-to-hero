# Node Exporter

## 🎯 Goal
Expose Linux host metrics and understand the main collectors used for infrastructure monitoring.

## Installation concepts
Node Exporter runs on the Linux host and exposes metrics, commonly on port `9100`.

## Prometheus configuration

```yaml
scrape_configs:
  - job_name: node
    static_configs:
      - targets: ["NODE_EXPORTER_HOST:9100"]
```

## Useful metrics
Explore `node_cpu_seconds_total`, `node_memory_MemAvailable_bytes`, filesystem metrics, network counters, load, and boot time.

## Collector concepts
Understand that collectors expose different metric families and can have different costs. Enable only what you need in constrained environments.

## 🧪 Lab
Install Node Exporter, scrape it, search its metric names, and build a host overview dashboard.

## Troubleshooting
Process running → port listening → `/metrics` works → network reachable → target configured → `up == 1`.

## Security
Restrict access to the exporter endpoint to monitoring systems and trusted networks.

## ✅ Completion
- [ ] Run Node Exporter.
- [ ] Scrape it.
- [ ] Identify CPU/memory/disk/network metrics.
- [ ] Build one dashboard.