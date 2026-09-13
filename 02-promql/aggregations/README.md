# PromQL Aggregations

## 🎯 Goal
Turn many time series into useful operational summaries while preserving the dimensions needed for diagnosis.

## Core operators

Practice `sum`, `avg`, `min`, `max`, `count`, `stddev`, and `topk`.

```promql
sum(rate(http_requests_total[5m]))
sum by (service) (rate(http_requests_total[5m]))
topk(5, rate(http_requests_total[5m]))
```

## `by` vs `without`

`by(service)` keeps only selected grouping labels. `without(instance)` removes one dimension while preserving others.

## Operational examples

Total request rate:

```promql
sum(rate(http_requests_total[5m]))
```

Requests by service:

```promql
sum by (service) (rate(http_requests_total[5m]))
```

## 🧪 Lab
Start with instance-level CPU or request metrics. Produce views by instance, service, namespace, and cluster. Explain which labels disappear at each aggregation.

## Pitfalls
Aggregating too early can hide the exact failing instance. Aggregating too little can make dashboards noisy.

## ✅ Completion
- [ ] Use five aggregation operators.
- [ ] Group by a label.
- [ ] Remove a label with `without`.
- [ ] Explain the diagnostic trade-off.