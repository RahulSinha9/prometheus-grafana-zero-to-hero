# 01 — Observability Basics

## What are we observing?

Observability helps answer:

> What is the system doing right now, and why?

For this repository, begin with **metrics** and later connect them to logs, traces and alerts.

## The four golden signals

A practical starting point is:

| Signal | Question |
|---|---|
| Latency | How long do requests take? |
| Traffic | How much work is the system handling? |
| Errors | How many requests are failing? |
| Saturation | How close are resources to their limits? |

## Metrics

A Prometheus metric is a numerical measurement associated with a name and optional labels.

Example:

```text
http_requests_total{method="GET",status="200"} 15234
```

The labels make the time series dimensions queryable.

## Important concepts

### Counter

A counter normally increases over time and is useful for events such as requests or errors.

```text
http_requests_total
```

### Gauge

A gauge can move up and down and is useful for values such as memory usage or active connections.

```text
node_memory_MemAvailable_bytes
```

### Histogram

A histogram helps measure distributions such as request duration and can be used to calculate quantiles.

```text
http_request_duration_seconds_bucket
```

## Cardinality

Every unique combination of metric name and label values creates a distinct time series. Avoid labels with an unbounded number of values such as raw user IDs or request IDs unless the workload and retention strategy explicitly support it.

## Exercise

1. Find five metrics exposed by a running Prometheus server.
2. Classify each as counter, gauge or histogram.
3. Identify every label on each metric.
4. Pick one metric and estimate how its cardinality could grow.

## Success criteria

You should be able to explain the difference between a metric, a label, a time series, a counter, a gauge and a histogram before moving to PromQL.