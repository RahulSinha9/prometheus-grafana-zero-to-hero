# Exporters

## 🎯 Goal
Understand exporters as adapters that turn system or application information into Prometheus metrics.

## Common exporters
- **Node Exporter:** Linux host metrics.
- **Blackbox Exporter:** HTTP, TCP, DNS, and ICMP-style probing.
- **Application exporters:** expose metrics for systems that cannot provide native Prometheus metrics.

## Exporter flow

```text
System → Exporter → /metrics → Prometheus → PromQL → Grafana
```

## What to configure
- Listen address and port.
- Collector selection.
- Authentication/network controls where applicable.
- Prometheus scrape job.
- Labels identifying environment and ownership.

## 🧪 Lab
Run Node Exporter, scrape it from Prometheus, find CPU/memory/filesystem metrics, and build a small dashboard.

Then stop the exporter and observe `up == 0`.

## Security
Do not expose exporter endpoints broadly without considering network access, authentication, and sensitive metadata.

## Troubleshooting
Check process → listening port → `/metrics` response → Prometheus connectivity → scrape target → query.

## ✅ Completion
- [ ] Run an exporter.
- [ ] Scrape it.
- [ ] Find five metrics.
- [ ] Build one query.
- [ ] Diagnose exporter downtime.