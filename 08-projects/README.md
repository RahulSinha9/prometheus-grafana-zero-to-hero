# 08 — Production-Style Projects

Bring the previous modules together into portfolio-ready observability projects that resemble real DevOps and SRE work.

## 🎯 Module Goal

Each project should demonstrate more than installation. You should show architecture, configuration, dashboards, alerting, troubleshooting, documentation, and reproducible deployment.

## 🏗️ Project 1 — Linux Observability

Build a complete monitoring stack for one or more Linux hosts.

### Suggested Components

- Prometheus
- Node Exporter
- Grafana
- Alertmanager

### Required Capabilities

- CPU monitoring
- Memory monitoring
- Disk capacity and I/O
- Network monitoring
- Host health dashboard
- High CPU alert
- Low disk-space alert
- Node-down alert

### Expected Outcome

A new engineer should be able to deploy the stack, open Grafana, identify unhealthy hosts, and follow a runbook to investigate the problem.

## ☸️ Project 2 — Kubernetes Observability

Build monitoring for a Kubernetes cluster and its workloads.

### Suggested Components

- Prometheus Operator / kube-prometheus-stack
- Grafana
- Alertmanager
- kube-state-metrics
- Node Exporter

### Required Capabilities

- Cluster overview
- Node health
- Namespace resource usage
- Pod restarts
- Workload health
- Scrape target visibility
- Kubernetes alerts
- Dashboard variables

### Expected Outcome

Demonstrate how to move from a cluster-wide symptom to a specific namespace, workload, pod, or node.

## 🏭 Project 3 — Production Monitoring Stack

Design a production-style observability platform with reliability and maintainability in mind.

### Suggested Architecture

```text
Applications
     │
     ├── Application metrics
     └── Exporters
            │
            ▼
       Prometheus
            │
      ┌─────┴─────┐
      ▼           ▼
   Grafana    Alertmanager
      │           │
      ▼           ▼
Dashboards    Notifications
```

### Production Concerns

Include:

- High availability considerations
- Persistent storage
- Retention strategy
- Resource sizing
- Alert routing
- Recording rules
- Dashboard provisioning
- Configuration as code
- Backup and recovery considerations
- Security and access control
- Operational runbooks

### Optional Advanced Topics

- Remote write / remote storage
- Long-term metrics retention
- Multi-cluster monitoring
- Federation
- SLO-based alerting
- GitOps deployment
- Terraform integration
- Kubernetes policy and RBAC

## 📁 Recommended Project Structure

```text
project/
├── README.md
├── docker-compose.yml or helm/
├── prometheus/
│   ├── prometheus.yml
│   └── rules/
├── alertmanager/
│   └── alertmanager.yml
├── grafana/
│   ├── dashboards/
│   └── provisioning/
├── runbooks/
├── scripts/
└── docs/
```

## 🧪 Project Acceptance Criteria

A project is complete when you can demonstrate:

- [ ] Reproducible deployment.
- [ ] Metrics are being collected.
- [ ] Dashboards answer operational questions.
- [ ] Alerts are actionable.
- [ ] Alert routing works.
- [ ] A failure can be intentionally reproduced.
- [ ] The failure can be detected from telemetry.
- [ ] The root cause can be investigated.
- [ ] Recovery can be verified.
- [ ] Runbooks explain the response.
- [ ] Configuration is stored in Git.

## 📊 Portfolio Evidence

For a strong project write-up, document:

1. Architecture diagram.
2. Deployment instructions.
3. Prometheus configuration.
4. Important PromQL queries.
5. Grafana dashboard screenshots or exported definitions.
6. Alert rules and routing.
7. Failure simulation.
8. Incident investigation.
9. Root-cause analysis.
10. Lessons learned.

## 🏁 Final Challenge

Take one of the projects and operate it like a real service:

> Deploy → Observe → Break → Detect → Investigate → Fix → Verify → Document

This is the point where individual Prometheus and Grafana skills become practical SRE/DevOps experience.

## 🎓 Completion Checklist

- [ ] Finish the Linux observability project.
- [ ] Finish the Kubernetes observability project.
- [ ] Build the production-style stack.
- [ ] Add dashboards and alerts.
- [ ] Simulate at least three incidents.
- [ ] Write incident reports.
- [ ] Keep the project reproducible from Git.
- [ ] Document architecture and operational decisions.