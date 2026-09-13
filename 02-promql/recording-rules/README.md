# Recording Rules

## 🎯 Goal
Precompute frequently used PromQL expressions so dashboards and alerts can query a simpler stored series.

## Why recording rules
Use them when a query is expensive, repeated, or important enough to standardize across many consumers.

Example:

```yaml
groups:
  - name: service.rules
    rules:
      - record: service:http_requests:rate5m
        expr: sum by (service) (rate(http_requests_total[5m]))
```

## Design principles
- Give the recorded metric a predictable name.
- Keep labels useful and bounded.
- Do not record every possible query.
- Document the expression and intended consumers.

## Recording vs alerting rules
Recording rules create new time series. Alerting rules evaluate a condition and produce an alert when it is true.

## 🧪 Lab
1. Identify an expensive dashboard query.
2. Create a recording rule.
3. Validate the new metric.
4. Change the dashboard to use it.
5. Compare query complexity and performance.

## Troubleshooting
Check rule syntax → Prometheus rule status → expression errors → recorded series → dashboard query.

## ✅ Completion
- [ ] Create a recording rule.
- [ ] Validate its output.
- [ ] Use it from Grafana.
- [ ] Explain when recording rules are appropriate.