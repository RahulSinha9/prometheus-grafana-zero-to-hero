# 07 — Real-World Incident Labs

Practice observability by intentionally creating common production-style failures and diagnosing them from symptoms to root cause.

## 🎯 Module Goal

The objective is not just to write queries. You should learn to use metrics as evidence during an incident and build a repeatable troubleshooting workflow.

## 🧪 Lab Catalog

### High CPU

**Scenario:** A workload consumes excessive CPU.

Practice:

- Generate CPU load.
- Detect saturation with PromQL.
- Identify the affected instance or pod.
- Correlate CPU usage with request rate and latency.
- Decide whether the problem is traffic, inefficient code, or a resource limit.

### Memory Leak

**Scenario:** Memory usage continuously grows until the process is killed or becomes unhealthy.

Practice:

- Detect a sustained memory trend.
- Compare working-set behavior over time.
- Check restarts and OOM-related signals.
- Identify the workload responsible.
- Distinguish a temporary spike from a leak.

### Disk Full

**Scenario:** A filesystem approaches capacity.

Practice:

- Alert before capacity reaches 100%.
- Check inode exhaustion.
- Identify the affected filesystem.
- Correlate disk pressure with application errors.
- Plan safe remediation.

### High Latency

**Scenario:** Requests become slower while availability may remain normal.

Practice:

- Analyze request duration histograms.
- Calculate p50, p95, and p99 latency.
- Compare latency by route or service.
- Correlate latency with CPU, memory, database, and network signals.

### Pod CrashLoopBackOff

**Scenario:** A Kubernetes container repeatedly starts and exits.

Practice:

- Detect restart growth.
- Check pod state metrics.
- Inspect container logs and events.
- Check configuration, probes, resources, and dependencies.
- Verify recovery after remediation.

### Service Down

**Scenario:** A monitored endpoint stops responding.

Practice:

- Detect `up == 0`.
- Determine whether one target or an entire service is affected.
- Separate exporter failure from application failure.
- Trace the problem through DNS, network, service discovery, and application health.

## 🔍 Incident Method

Use the same workflow for every lab:

```text
1. Detect
   ↓
2. Scope the impact
   ↓
3. Identify affected labels
   ↓
4. Compare against baseline
   ↓
5. Correlate related metrics
   ↓
6. Form a hypothesis
   ↓
7. Validate with evidence
   ↓
8. Remediate
   ↓
9. Verify recovery
   ↓
10. Document the root cause
```

## 📝 Incident Report Template

For every lab, record:

```text
Incident:
Start time:
Impact:
Symptoms:
Primary metric:
Affected service:
Affected instance/pod:
Queries used:
Root cause:
Remediation:
Verification:
Preventive alert/runbook:
```

## ✅ Completion Checklist

- [ ] Diagnose high CPU.
- [ ] Diagnose a memory leak.
- [ ] Detect disk pressure.
- [ ] Analyze high latency.
- [ ] Diagnose CrashLoopBackOff.
- [ ] Diagnose service-down conditions.
- [ ] Write an incident report for each lab.
- [ ] Explain the evidence behind each root cause.

## 🚀 Next Step

Continue to [`08-projects`](../08-projects/) and turn these individual skills into complete observability projects.