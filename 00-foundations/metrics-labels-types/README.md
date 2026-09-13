# Metrics, Labels & Metric Types

## 🎯 Goal
Learn how Prometheus represents measurements and how metric design affects querying, storage, and alerting.

## Metric anatomy

A series can look like:

```promql
http_requests_total{service="api",method="GET",status="200"}
```

The metric name describes the measurement. Labels describe dimensions. Every unique label combination creates a separate time series.

## Labels and cardinality

Good labels usually represent bounded dimensions such as `service`, `method`, `status`, `namespace`, or `instance`.

Avoid labels containing values such as request IDs, user IDs, full URLs, session IDs, or timestamps. These can create huge numbers of series.

## Metric types

### Counter
Monotonically increases except for resets. Examples: requests, errors, completed jobs.

```promql
rate(http_requests_total[5m])
```

### Gauge
Can move up or down. Examples: memory available, queue depth, temperature.

### Histogram
Stores observations in buckets plus count and sum. Excellent for latency distributions and aggregatable percentiles.

### Summary
Calculates quantiles at the client side and exposes count and sum. Understand its aggregation limitations before choosing it for distributed systems.

## Naming practice
Prefer names that describe the quantity and unit clearly, such as `http_request_duration_seconds` rather than ambiguous names.

## 🧪 Labs
1. Find five metrics from Node Exporter.
2. Classify each as counter, gauge, histogram, or summary.
3. Identify every label on one series.
4. Design a metric for API requests.
5. Identify two dangerous high-cardinality labels.

## 🔍 Challenge
Given a metric with 10 services, 5 methods, 6 statuses, and 100 instances, calculate the potential series count before adding another label.

## ✅ Completion
- [ ] Explain a time series.
- [ ] Explain cardinality.
- [ ] Choose metric types correctly.
- [ ] Design safe labels.
- [ ] Write useful metric names.