# PromQL Selectors

## 🎯 Goal
Learn how to select exactly the series needed for investigation.

## Instant vectors

```promql
up
node_memory_MemAvailable_bytes
```

## Label matchers

```promql
up{job="node"}
up{job!="node"}
http_requests_total{status=~"5.."}
http_requests_total{path!~"/health.*"}
```

Learn `=`, `!=`, `=~`, and `!~` and understand that regex matchers can match multiple series.

## Range vectors

```promql
rate(http_requests_total[5m])
```

The `[5m]` selects the samples available during the previous five minutes for each matching series.

## 🧪 Practice
Write selectors for:
- One service.
- One instance.
- All 5xx responses.
- All namespaces except monitoring.
- A five-minute range of a counter.

## Common mistakes
- Filtering on a label that does not exist.
- Selecting too many high-cardinality series.
- Forgetting that a regex may match multiple values.
- Using a counter directly when a rate is required.

## ✅ Completion
- [ ] Use all matcher operators.
- [ ] Use instant vectors.
- [ ] Use range vectors.
- [ ] Explain exactly which series a selector returns.