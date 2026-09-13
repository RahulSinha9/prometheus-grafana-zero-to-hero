# Linux CPU Monitoring

## 🎯 Goal
Measure CPU utilization correctly and distinguish sustained saturation from short spikes.

## Core metric
`node_cpu_seconds_total` is a counter partitioned by CPU mode.

A common utilization query is:

```promql
100 * (1 - avg by (instance) (
  rate(node_cpu_seconds_total{mode="idle"}[5m])
))
```

## Investigate CPU problems
Ask:
- Which host?
- Which process/container?
- User CPU or system CPU?
- Is there I/O wait?
- Is the load sustained?
- Did traffic change?

## 🧪 Lab
Generate controlled CPU load, observe the dashboard, identify the host, correlate CPU with request traffic, then stop the workload and verify recovery.

## Alert design
Avoid paging on tiny spikes. Use a sustained threshold appropriate to workload and capacity.

## ✅ Completion
- [ ] Query CPU utilization.
- [ ] Explain CPU modes.
- [ ] Detect sustained saturation.
- [ ] Correlate CPU with workload.