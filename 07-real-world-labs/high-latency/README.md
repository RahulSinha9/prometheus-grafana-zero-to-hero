# Incident Lab — High Latency

## 🎯 Objective
Use histogram metrics and correlation to diagnose a latency regression.

## Scenario
API users report slow requests while request volume remains normal.

## Inject
Introduce controlled application delay or a slow dependency in a disposable environment.

## Detect
Use p95/p99 latency rather than relying only on average latency.

```promql
histogram_quantile(0.95, sum by (le) (rate(http_request_duration_seconds_bucket[5m])))
```

## Investigate
Compare latency with traffic, errors, CPU, memory, downstream calls, and deployment changes. Identify which endpoint or dependency is affected.

## Recover
Remove the injected delay or correct the dependency. Verify percentile latency returns to baseline.

## Challenge
Explain why average latency can remain acceptable while p99 becomes dangerous.

## Evidence
Record percentile graphs, affected route, dependency, alert, timeline, root cause, and recovery.

## ✅ Complete when
- [ ] Detect p95/p99 degradation.
- [ ] Identify scope.
- [ ] Correlate with another signal.
- [ ] Prove recovery.