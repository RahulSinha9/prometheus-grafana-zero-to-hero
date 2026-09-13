# Project — Production Monitoring Stack

## 🎯 Objective
Design a production-style observability platform with explicit reliability, scalability, security, and operational decisions.

## Reference architecture

```text
Applications / Kubernetes
          │
          ▼
 Prometheus + Exporters
      │           │
      ▼           ▼
   Grafana    Alertmanager
      │           │
      ▼           ▼
Dashboards    Notifications
          │
          ▼
     Runbooks / Incidents
```

## Required design decisions
Document:
- Deployment model.
- Resource requests/limits.
- Scrape intervals.
- Retention.
- Persistent storage.
- High availability strategy.
- Alert ownership/routing.
- Dashboard provisioning.
- Secrets management.
- RBAC and network security.
- Backup/recovery.
- Upgrade strategy.

## Advanced options
Explore remote write, long-term storage, federation, multi-cluster monitoring, SLO-based alerting, GitOps, and Terraform.

## Operational readiness
Create runbooks for Prometheus unavailable, exporter failure, noisy alert, full storage, Alertmanager failure, and Grafana outage.

## Game day
Break the platform intentionally in a safe environment. Verify detection, notification, investigation, mitigation, and recovery.

## Acceptance criteria
- [ ] Reproducible deployment.
- [ ] Version-controlled configuration.
- [ ] Dashboards and alerts operational.
- [ ] Failure scenarios documented.
- [ ] Recovery tested.
- [ ] Security decisions documented.
- [ ] Capacity and retention assumptions documented.
