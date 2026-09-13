# 04 — Alerting

Learn how to design reliable Prometheus and Alertmanager alerting that helps engineers respond to real incidents without creating alert fatigue.

## 🎯 Module Goal

You should be able to write alert rules, understand alert lifecycle, route alerts to the right team, use silences safely, and connect notifications to operational workflows.

## 📚 Learning Path

### Alert Rules

Learn the structure of a Prometheus alert:

```yaml
- alert: HighErrorRate
  expr: |
    sum(rate(http_requests_total{status=~"5.."}[5m]))
      /
    sum(rate(http_requests_total[5m])) > 0.05
  for: 10m
  labels:
    severity: warning
  annotations:
    summary: High HTTP error rate
```

Understand:

- Expression
- `for` duration
- Labels
- Annotations
- Severity
- Runbook links

### Alertmanager

Understand the difference between **detecting an alert** and **managing a notification**.

Prometheus evaluates rules; Alertmanager handles grouping, routing, inhibition, silencing, and notification delivery.

### Routing

Design routing based on labels such as:

```text
severity
team
service
environment
cluster
```

Learn parent and child routes, grouping, repeat intervals, and receiver selection.

### Silences

Use silences during planned maintenance or while an incident is already being handled.

A good silence should be:

- Narrowly scoped
- Time limited
- Documented with a reason
- Owned by a person or team

### Notification Channels

Explore integrations such as email, chat systems, incident-management platforms, and webhooks. The important goal is to ensure alerts reach the correct responders with enough context to act.

## 🧪 Hands-On Labs

- Create a high-CPU alert.
- Create a service-down alert using `up == 0`.
- Add a `for` duration to prevent transient alerts.
- Route critical alerts differently from warnings.
- Group alerts by service and cluster.
- Create and expire a silence.
- Add a runbook URL to an alert annotation.

## 🚨 Alert Quality Checklist

Before creating an alert, ask:

1. Is this condition actionable?
2. Who should respond?
3. What user impact does it indicate?
4. Is the threshold meaningful?
5. Could this alert flap frequently?
6. Does it have useful context?
7. Is there a runbook or troubleshooting path?

## 🔍 Incident Flow

```text
Metric
  │
  ▼
PromQL alert rule
  │
  ▼
Prometheus
  │
  ▼
Alertmanager
  │
  ├── Group
  ├── Route
  ├── Inhibit
  └── Silence
  │
  ▼
Notification
  │
  ▼
Engineer response
```

## ✅ Completion Checklist

- [ ] Write a Prometheus alert rule.
- [ ] Use `for` correctly.
- [ ] Add useful labels and annotations.
- [ ] Understand Alertmanager responsibilities.
- [ ] Configure routing.
- [ ] Group related alerts.
- [ ] Create and review silences.
- [ ] Connect a notification receiver.
- [ ] Build an actionable runbook link.

## 🚀 Next Step

Continue to [`05-linux-monitoring`](../05-linux-monitoring/) and apply these concepts to CPU, memory, disk, and network monitoring.