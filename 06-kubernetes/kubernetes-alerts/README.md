# Kubernetes Alerts

## 🎯 Goal
Build alerts around cluster symptoms that require action rather than simply reporting every abnormal metric.

## Alert categories
- Node not ready.
- Pod restart/crash loop.
- Deployment replica mismatch.
- High CPU or memory.
- Persistent volume capacity.
- Failed jobs.
- Missing scrape targets.

## Alert example concepts
For each alert define expression, duration, severity, ownership, summary, description, and runbook.

## 🧪 Labs
Trigger a controlled pod failure, node/resource pressure scenario, and deployment mismatch. Verify that alerts identify the affected namespace/workload and recover after the issue is fixed.

## Avoiding noise
Use `for` durations, appropriate thresholds, grouping, and inhibition. Alert on user/service impact where possible.

## Investigation
Start from the alert labels, then use Grafana and PromQL to determine scope and severity. Confirm the condition with Kubernetes commands and events.

## ✅ Completion
- [ ] Create three Kubernetes alerts.
- [ ] Add runbook links.
- [ ] Test routing.
- [ ] Test recovery.