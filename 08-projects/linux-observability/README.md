# Project — Linux Observability

## 🎯 Objective
Build a complete monitoring solution for Linux hosts and operate it like a small production service.

## Architecture

```text
Linux Host → Node Exporter → Prometheus → Grafana
                                  │
                                  └→ Alertmanager
```

## Required components
- Prometheus.
- Node Exporter.
- Grafana.
- Alertmanager.

## Dashboards
Create panels for CPU utilization, memory availability, swap, filesystem capacity, disk I/O, network traffic, and host availability.

## Alerts
Implement at least:
- Host down.
- Sustained high CPU.
- Low filesystem capacity.
- High memory pressure.

Each alert needs severity, owner, description, and a runbook.

## Failure simulations
Run at least three controlled incidents from the real-world labs and document the investigation.

## Repository structure

```text
linux-observability/
├── prometheus/
├── grafana/
├── alertmanager/
├── dashboards/
├── runbooks/
├── scripts/
└── README.md
```

## Acceptance criteria
- [ ] Fresh deployment works.
- [ ] Metrics are visible.
- [ ] Dashboards answer operational questions.
- [ ] Alerts route correctly.
- [ ] Three failures are reproducible.
- [ ] Incident reports are included.
