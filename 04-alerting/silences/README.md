# Alertmanager Silences

## 🎯 Goal
Suppress known alerts temporarily without hiding unrelated incidents.

## When to use
Use a silence for planned maintenance or a known temporary condition. Do not use it to hide a permanently noisy alert instead of fixing the alert.

## Silence design
A good silence has:

- Precise matchers.
- Clear creator/owner.
- Reason/comment.
- Start time.
- Expiration time.

## 🧪 Lab
1. Trigger a test alert.
2. Create a narrow silence.
3. Verify only the intended alert is suppressed.
4. Wait for expiration or remove it.
5. Verify notifications resume.

## Safety
Avoid broad matchers such as only `severity=critical` unless that is explicitly intended. Prefer matching the affected service or instance.

## Operational review
During incidents, check whether a silence is hiding a related symptom. Review expired silences and remove obsolete ones.

## ✅ Completion
- [ ] Create a narrow silence.
- [ ] Explain its scope.
- [ ] Set an expiration.
- [ ] Verify notification recovery.