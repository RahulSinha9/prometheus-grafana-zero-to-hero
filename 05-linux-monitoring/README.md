# 05 — Linux Monitoring

Build practical Linux observability skills with Node Exporter and Prometheus.

## 🎯 Module Goal

Learn how operating-system behavior becomes Prometheus metrics and how to use those metrics to diagnose CPU, memory, disk, and network problems.

## 📚 Learning Path

### Node Exporter

Understand how Node Exporter exposes Linux host metrics for Prometheus scraping.

Focus on:

- Exporter installation
- Port `9100`
- `/metrics` endpoint
- Prometheus scrape configuration
- Metric families and labels
- Collector concepts

### CPU

Learn to distinguish CPU usage from load average and understand user, system, idle, iowait, and steal time.

Useful concepts and metrics include:

- CPU mode time
- CPU utilization
- Load average
- Per-core saturation
- Context switching

Example PromQL pattern:

```promql
100 * (1 - avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])))
```

### Memory

Monitor:

- Total memory
- Available memory
- Used memory
- Swap
- Memory pressure

Do not treat cache as automatically unhealthy. Prefer `MemAvailable`-based analysis for practical Linux capacity questions.

### Disk

Learn to monitor both **capacity** and **I/O performance**.

Check:

- Filesystem utilization
- Inodes
- Read/write throughput
- IOPS
- I/O wait
- Device saturation

### Network

Monitor:

- Receive/transmit throughput
- Packet rates
- Errors
- Drops
- Interface state

Correlate network metrics with application latency rather than looking at throughput alone.

## 🧪 Hands-On Labs

- Install Node Exporter.
- Scrape it with Prometheus.
- Generate CPU load and observe the metrics.
- Consume memory and observe memory pressure.
- Fill a test filesystem safely and detect disk pressure.
- Generate network traffic and observe interface metrics.
- Build a Linux host dashboard in Grafana.

## 🔍 Troubleshooting Workflow

```text
Symptom
  │
  ├── CPU → utilization / load / iowait
  ├── Memory → available / swap / pressure
  ├── Disk → capacity / inodes / I/O
  └── Network → throughput / errors / drops
          │
          ▼
     PromQL analysis
          │
          ▼
     Grafana timeline
```

## ✅ Completion Checklist

- [ ] Install Node Exporter.
- [ ] Scrape Linux metrics.
- [ ] Explain CPU utilization and load.
- [ ] Analyze memory pressure.
- [ ] Detect disk capacity problems.
- [ ] Analyze disk I/O.
- [ ] Detect network errors and drops.
- [ ] Build a Linux monitoring dashboard.

## 🚀 Next Step

Continue to [`06-kubernetes`](../06-kubernetes/) and apply the same observability principles to Kubernetes workloads.