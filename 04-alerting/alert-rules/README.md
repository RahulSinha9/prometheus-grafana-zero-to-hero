# Prometheus Alert Rules

## 🎯 Goal
Write alerts that represent actionable symptoms and include enough context for responders.

## Example

```yaml
- alert: InstanceDown
  expr: up{job="node"} == 0
  for: 5m
  labels:
    severity: critical
  annotations:
    summary: Node is unreachable
    description: Prometheus cannot scrape the node target.
```

## Alert anatomy
Study `alert`, `expr`, `for`, labels, and annotations. Labels are used for routing; annotations provide human-readable context.

## Alert design
Prefer symptoms that represent user or service impact. Add a duration to avoid paging on short transient failures when appropriate.

## 🧪 Labs
Create alerts for target down, high CPU, high error rate, and high latency. Trigger each one intentionally and verify recovery.

## Testing
Validate expressions with PromQL first. Then load the rule, inspect rule status, trigger the condition, and verify the alert state transition.

## Runbooks
Every paging alert should point responders toward a practical first diagnostic step.

## ✅ Completion
- [ ] Create four alerts.
- [ ] Use severity labels.
- [ ] Test `for` behavior.
- [ ] Trigger and recover each alert.