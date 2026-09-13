# Linux Memory Monitoring

## 🎯 Goal
Understand available memory, cache, swap, and pressure instead of treating all used memory as a failure.

## Core metrics
Explore `node_memory_MemTotal_bytes`, `node_memory_MemAvailable_bytes`, and swap metrics.

Example utilization:

```promql
100 * (1 - node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)
```

## Investigation
When memory rises, determine whether the cause is application growth, cache, a workload spike, or a leak. Check swap behavior and process/container memory as appropriate.

## 🧪 Lab
Run a controlled memory workload, observe available memory, compare it with application behavior, and recover the workload.

## Memory leak exercise
Graph memory over time. A steady upward trend without recovery after normal workload changes is more suspicious than a one-time spike.

## Alerting
Use sustained thresholds and consider workload-specific baselines.

## ✅ Completion
- [ ] Query available memory.
- [ ] Understand swap.
- [ ] Identify a growth trend.
- [ ] Investigate controlled memory pressure.