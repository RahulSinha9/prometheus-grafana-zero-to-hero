# 02 — PromQL

Master Prometheus Query Language (PromQL) for troubleshooting, dashboards, alerting, and capacity analysis.

## 🎯 Module Goal

You should finish this module able to move from a vague operational question to a useful PromQL query.

Examples:

- Which instances are down?
- What is the request rate?
- Which service consumes the most CPU?
- What is the 95th percentile latency?
- Is error rate increasing?

## 📚 Learning Path

### Selectors

Learn the difference between instant-vector and range-vector selectors.

```promql
up
up{job="node"}
up{job=~"api|web"}
http_requests_total[5m]
```

Practice label matchers:

- `=` exact match
- `!=` negative match
- `=~` regex match
- `!~` negative regex match

### Aggregations

Learn `sum`, `avg`, `min`, `max`, `count`, `topk`, and grouping with `by` / `without`.

```promql
sum by (job) (rate(http_requests_total[5m]))
```

Understand when aggregation removes useful labels and how to preserve the dimensions needed for troubleshooting.

### Rate & Increase

Counters must normally be analyzed with functions such as `rate()` and `increase()`.

```promql
rate(http_requests_total[5m])
increase(http_requests_total[1h])
```

Understand counter resets, scrape intervals, range windows, and the difference between a per-second rate and total increase.

### Histograms

Learn histogram buckets, `_bucket`, `_sum`, and `_count` series and use `histogram_quantile()` for latency analysis.

```promql
histogram_quantile(
  0.95,
  sum by (le) (rate(http_request_duration_seconds_bucket[5m]))
)
```

### Joins

Understand vector matching and controlled joins with `on`, `ignoring`, `group_left`, and `group_right`.

Use joins when useful metadata exists in another metric, but avoid unnecessary complexity and accidental many-to-many matches.

### Recording Rules

Learn how to precompute expensive or frequently used expressions.

```yaml
groups:
  - name: service.rules
    rules:
      - record: service:http_requests_per_second
        expr: sum by (service) (rate(http_requests_total[5m]))
```

## 🧪 Practice Queries

```promql
# Targets currently down
sum by (job) (up == 0)

# Request rate by service
sum by (service) (rate(http_requests_total[5m]))

# Error percentage
100 * sum(rate(http_requests_total{status=~"5.."}[5m]))
  / sum(rate(http_requests_total[5m]))
```

## 🔍 Query Debugging Method

1. Start with the metric name.
2. Inspect labels.
3. Add a label matcher.
4. Add a range selector when working with time-dependent functions.
5. Add aggregation only after the raw result makes sense.
6. Validate the query against the operational question.

## ✅ Completion Checklist

- [ ] Write instant and range selectors.
- [ ] Use label matchers confidently.
- [ ] Aggregate by useful dimensions.
- [ ] Use `rate()` and `increase()` correctly.
- [ ] Query histograms.
- [ ] Understand vector matching.
- [ ] Create a recording rule.
- [ ] Debug a query step by step.

## 🚀 Next Step

Continue to [`03-grafana`](../03-grafana/) and turn PromQL knowledge into dashboards and reusable visualization workflows.