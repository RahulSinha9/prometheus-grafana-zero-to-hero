# Observability Basics

## 🎯 Goal
Understand how observability helps engineers answer both known and unexpected questions about a running system.

## What to learn

### Monitoring vs observability
Monitoring tells you whether predefined conditions are healthy. Observability focuses on whether the available telemetry lets you explain why the system behaves as it does.

### The three signals
- **Metrics:** numeric measurements over time; excellent for alerting and trends.
- **Logs:** detailed event records; useful for exact errors and context.
- **Traces:** request journeys across services; useful for distributed latency and dependency analysis.

### Golden signals
Learn latency, traffic, errors, and saturation. For an HTTP API, identify one metric for each signal and explain why it matters.

### SLI / SLO / SLA
Define an SLI such as successful requests divided by total requests, then turn it into an SLO such as 99.9% availability. Understand that an SLA is a customer/business agreement rather than simply another metric.

## 🧪 Hands-on
1. Pick a web service.
2. List its important user journeys.
3. Define one SLI for availability and one for latency.
4. Identify the metrics, logs, and traces needed to investigate failures.
5. Write three questions your telemetry should answer during an incident.

## 🔍 Incident exercise
Imagine users report slow requests. Decide which signal you inspect first, then explain how you would move from latency → affected endpoint → dependency → root cause.

## ✅ Completion
- [ ] Explain monitoring vs observability.
- [ ] Explain metrics, logs, and traces.
- [ ] Define four golden signals.
- [ ] Write an SLI and SLO.
- [ ] Design a basic telemetry plan.