# Grafana Dashboards

## 🎯 Goal
Design dashboards that help an engineer detect and diagnose problems quickly.

## Dashboard hierarchy
Start with service health, then drill into traffic, errors, latency, saturation, and individual instances or pods.

## Recommended sections
1. Availability.
2. Traffic.
3. Error rate.
4. Latency.
5. Resource saturation.
6. Dependency or instance breakdown.

## Dashboard principles
- Put high-value information first.
- Use consistent units.
- Make legends meaningful.
- Keep queries understandable.
- Avoid panels that show numbers without operational context.

## 🧪 Lab
Build a service dashboard containing:

```text
Availability | Request rate | Error rate
Latency p95  | CPU          | Memory
```

Then introduce a failure and verify that the dashboard makes the incident visible.

## Review questions
Can a new engineer identify the affected service? Can they identify when the problem started? Can they drill down to the responsible instance or workload?

## ✅ Completion
- [ ] Build an overview.
- [ ] Add drill-down panels.
- [ ] Add meaningful units.
- [ ] Test during a failure.