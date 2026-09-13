# Incident Lab — High CPU

## 🎯 Objective
Practice detecting and diagnosing sustained CPU saturation.

## Scenario
A Linux host or container suddenly consumes excessive CPU and application latency begins to rise.

## Inject
Use a disposable environment and a controlled CPU workload. Do not run destructive stress tests on production systems.

## Detect
Build a CPU dashboard and alert using a sustained utilization threshold.

## Investigate
1. Identify the host.
2. Determine when CPU increased.
3. Compare user/system/I/O wait behavior.
4. Identify the responsible process/container.
5. Compare CPU with traffic and latency.

## Recover
Stop the test workload or apply the documented mitigation. Verify CPU and service latency return to baseline.

## Evidence
Record the alert timestamp, PromQL query, graph, process/workload, root cause, mitigation, and recovery proof.

## Questions
Was this a traffic increase, runaway process, inefficient code path, or capacity issue?

## ✅ Complete when
- [ ] Alert fires.
- [ ] Root cause is identified.
- [ ] Recovery is visible in metrics.
- [ ] Incident report is written.