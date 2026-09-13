# PromQL Histograms

## 🎯 Goal
Use histogram metrics to understand latency distributions instead of relying only on averages.

## Histogram series
A Prometheus histogram commonly exposes:

- `metric_bucket` — cumulative bucket counts.
- `metric_sum` — sum of observations.
- `metric_count` — number of observations.

## Percentiles
A p95 query commonly looks like:

```promql
histogram_quantile(
  0.95,
  sum by (le) (rate(http_request_duration_seconds_bucket[5m]))
)
```

The `le` label identifies the upper bucket boundary and must be preserved for the quantile calculation.

## Average latency

```promql
rate(http_request_duration_seconds_sum[5m])
/
rate(http_request_duration_seconds_count[5m])
```

Compare averages with p95/p99 to see why averages can hide tail latency.

## 🧪 Lab
Generate requests with a mix of fast and slow responses. Compare average, p50, p95, and p99 latency.

## Pitfalls
- Incorrect aggregation before `histogram_quantile`.
- Removing `le`.
- Comparing percentiles without considering traffic volume.
- Treating a percentile as the latency of every request.

## ✅ Completion
- [ ] Explain bucket/count/sum.
- [ ] Calculate average latency.
- [ ] Calculate p95.
- [ ] Explain tail latency.