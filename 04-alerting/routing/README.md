# Alert Routing

## 🎯 Goal
Route alerts to the right team or receiver using predictable labels and a maintainable routing tree.

## Label strategy
Common routing labels include:

```text
severity
team
service
environment
namespace
```

## Example

```yaml
route:
  receiver: default
  routes:
    - matchers:
        - severity="critical"
      receiver: oncall
```

## Design principles
- Keep a safe default receiver.
- Route using stable labels.
- Avoid overlapping routes that are difficult to reason about.
- Document ownership.

## 🧪 Lab
Create warning and critical alerts. Route warnings to a general channel and critical alerts to an on-call receiver. Verify both paths.

## Debugging
Inspect alert labels → find matching route → check receiver → inspect notification logs.

## ✅ Completion
- [ ] Design a label taxonomy.
- [ ] Configure two routes.
- [ ] Test fallback behavior.
- [ ] Test critical routing.