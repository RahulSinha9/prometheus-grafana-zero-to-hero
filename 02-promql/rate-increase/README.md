# `rate()` and `increase()`

## 🎯 Goal
Correctly interpret Prometheus counters and avoid graphing monotonically increasing values as if they were instantaneous activity.

## Counter example

```promql
http_requests_total
```

The value grows as requests occur and can reset when the process restarts.

## `rate()`

```promql
rate(http_requests_total[5m])
```

This estimates the per-second average increase over the selected range and handles counter resets.

## `increase()`

```promql
increase(http_requests_total[1h])
```

This estimates the total increase over the selected period.

## Choosing the range
A very short range can be noisy or have too few samples. A longer range smooths behavior but may hide short spikes. Match the range to scrape interval and operational question.

## 🧪 Labs
1. Plot a raw counter.
2. Plot `rate()`.
3. Compare `increase()` over one hour.
4. Restart the exporter/application.
5. Confirm the rate still behaves sensibly after a counter reset.

## Common mistakes
- Applying `rate()` to a gauge.
- Choosing an inappropriate range.
- Ignoring scrape interval.
- Treating `increase()` as an instantaneous value.

## ✅ Completion
- [ ] Explain counter resets.
- [ ] Use `rate()`.
- [ ] Use `increase()`.
- [ ] Choose a sensible range.