# Kubernetes Node Monitoring

## 🎯 Goal
Understand node health, capacity, resource pressure, and scheduling impact.

## Signals
Monitor readiness, CPU, memory, filesystem, network, and pressure-related conditions.

## Investigation flow

```text
Node alert
  ↓
Which node?
  ↓
Ready / NotReady?
  ↓
Resource pressure?
  ↓
Kubelet / runtime / network?
  ↓
Which workloads are affected?
```

## 🧪 Lab
Create a controlled resource-pressure scenario. Identify the node, observe resource metrics, inspect Kubernetes conditions/events, and verify recovery.

## Capacity planning
Compare allocatable capacity with workload requests and actual usage. Understand that high utilization and unschedulable pods can be related but are not identical symptoms.

## Alerts
Practice node-not-ready, high resource utilization, and filesystem alerts with meaningful durations.

## ✅ Completion
- [ ] Monitor node readiness.
- [ ] Monitor resources.
- [ ] Inspect node conditions.
- [ ] Connect node symptoms to affected workloads.