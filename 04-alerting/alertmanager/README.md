# Alertmanager

## 🎯 Goal
Understand how Alertmanager turns Prometheus alerts into organized notifications.

## Responsibilities
Alertmanager handles grouping, routing, silencing, inhibition, and notification delivery. Prometheus remains responsible for evaluating alert expressions.

## Flow

```text
PromQL → Alert rule → Prometheus → Alertmanager → Receiver
```

## Configuration concepts
Study `route`, `receivers`, `group_by`, `group_wait`, `group_interval`, `repeat_interval`, `inhibit_rules`, and `templates`.

## Grouping
Group related alerts so responders receive one useful notification instead of dozens of nearly identical messages.

## 🧪 Lab
Generate several alerts from one service. Configure grouping by service and severity. Verify the resulting notification behavior.

## Troubleshooting
Alert firing in Prometheus but not delivered → check Alertmanager target → inspect Alertmanager UI/logs → inspect route matchers → inspect receiver configuration.

## Security
Protect webhook credentials and notification secrets. Do not commit sensitive tokens to the repository.

## ✅ Completion
- [ ] Run Alertmanager.
- [ ] Configure a receiver.
- [ ] Configure grouping.
- [ ] Route by severity.
- [ ] Diagnose a routing failure.