# 00 — Observability Foundations

Build the mental model required to work confidently with Prometheus, Grafana, and production observability systems.

## 🎯 Module Goal

By the end of this module, you should be able to explain **what observability is, why metrics matter, how Prometheus represents metrics, and how the main Prometheus components fit together**.

## 📚 Learning Path

### 1. Observability Basics

Learn the three major observability signals:

- **Metrics** — numerical measurements collected over time.
- **Logs** — timestamped records describing events.
- **Traces** — request-level context showing how work moves across services.

Focus on the difference between traditional monitoring and observability. Monitoring tells you whether known conditions are healthy; observability helps you investigate unknown failure modes.

### 2. Metrics, Labels & Types

Understand the Prometheus data model:

- Metric names
- Labels and label cardinality
- Time series
- Samples and timestamps
- Counter
- Gauge
- Histogram
- Summary

Example metric:

```text
http_requests_total{method="GET",status="200",service="api"} 18452
```

Practice identifying which parts describe the metric and which parts create individual time series.

### 3. Prometheus Architecture

Understand the end-to-end flow:

```text
Application / Exporter
        │
        ▼
   /metrics endpoint
        │
        ▼
    Prometheus
        │
        ├── PromQL
        ├── Rules
        └── Alerting
        │
        ▼
      Grafana
```

Learn the roles of scraping, exporters, the TSDB, PromQL, recording rules, alert rules, and remote storage integrations.

## 🧪 Hands-On Exercises

- Identify metrics exposed by a Linux host.
- Classify real metrics as counter, gauge, histogram, or summary.
- Add useful labels to a sample application metric.
- Explain why high-cardinality labels can become expensive.
- Draw the path from an application metric to a Grafana dashboard.
- Identify where Prometheus stores scraped samples.

## 🔍 Troubleshooting Questions

Use these questions while learning:

1. Is the application exposing a `/metrics` endpoint?
2. Can Prometheus reach the target?
3. Is the target being scraped successfully?
4. Does the metric have the labels you expect?
5. Is the selected metric type appropriate for the data?
6. Could a label create uncontrolled time-series cardinality?

## ✅ Completion Checklist

- [ ] Explain metrics, logs, and traces.
- [ ] Explain monitoring vs observability.
- [ ] Understand time series and labels.
- [ ] Distinguish Counter, Gauge, Histogram, and Summary.
- [ ] Explain Prometheus scraping.
- [ ] Describe the major Prometheus components.
- [ ] Explain why metric cardinality matters.

## 🚀 Next Step

Continue to [`01-prometheus`](../01-prometheus/) to install Prometheus, configure scraping, discover targets, and work with exporters.