<div align="center">

# 🚀 Prometheus + Grafana Zero to Hero

### Build • Monitor • Query • Visualize • Alert • Troubleshoot

A hands-on, production-minded learning journey for mastering **Prometheus, PromQL, Grafana, Alertmanager, exporters, and Kubernetes observability** — from your first metric to real incident investigations.

[![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?logo=prometheus&logoColor=white)](https://prometheus.io/)
[![Grafana](https://img.shields.io/badge/Grafana-F46800?logo=grafana&logoColor=white)](https://grafana.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Helm](https://img.shields.io/badge/Helm-0F1689?logo=helm&logoColor=white)](https://helm.sh/)
[![License](https://img.shields.io/badge/Learning--Project-Open--Source-brightgreen)](#)

**The goal:** stop memorizing dashboards and start thinking like an observability engineer.

</div>

---

## 🌟 What This Repository Is

This repository is a **learn-by-doing observability lab**.

Instead of reading isolated documentation, every stage connects the full monitoring workflow:

```text
┌───────────────┐
│ Applications  │
└───────┬───────┘
        │ metrics
        ▼
┌───────────────┐
│  Prometheus   │
└───────┬───────┘
        │
        ├──► PromQL ──► Analysis
        │
        ├──► Grafana ──► Dashboards
        │
        └──► Alert Rules
                 │
                 ▼
          ┌───────────────┐
          │ Alertmanager  │
          └───────┬───────┘
                  │ Alerts
                  ▼
          🚨 Incident Response
                  │
                  ▼
          🔍 Troubleshooting
```

> **Learn → Build → Query → Visualize → Break → Troubleshoot → Improve**

---

## 🗺️ The Zero-to-Hero Roadmap

| Stage | Focus | You will learn |
|:---:|---|---|
| 🟢 **00** | Foundations | Observability, metrics, labels, cardinality, Prometheus architecture |
| 🔵 **01** | Prometheus | Installation, configuration, targets, service discovery, exporters |
| 🟣 **02** | PromQL | Selectors, aggregation, rates, histograms, joins, recording rules |
| 🟠 **03** | Grafana | Datasources, dashboards, panels, variables, provisioning |
| 🔴 **04** | Alerting | Rules, Alertmanager, routing, silences, notifications |
| 🟢 **05** | Linux Monitoring | Node Exporter, CPU, memory, disk, network |
| 🔵 **06** | Kubernetes | kube-state-metrics, nodes, pods, kube-prometheus-stack, alerts |
| 🟠 **07** | Real-World Labs | CPU spikes, memory leaks, disk full, latency, CrashLoopBackOff, outages |
| 🏆 **08** | Projects | Linux, Kubernetes and production-style observability projects |

---

## 📂 Repository Structure

```text
prometheus-grafana-zero-to-hero/
│
├── 00-foundations/
│   ├── observability-basics/
│   ├── metrics-labels-types/
│   └── prometheus-architecture/
│
├── 01-prometheus/
│   ├── installation/
│   ├── configuration/
│   ├── scrape-targets/
│   ├── service-discovery/
│   └── exporters/
│
├── 02-promql/
│   ├── selectors/
│   ├── aggregations/
│   ├── rate-increase/
│   ├── histogram/
│   ├── joins/
│   └── recording-rules/
│
├── 03-grafana/
│   ├── prometheus-datasource/
│   ├── dashboards/
│   ├── variables/
│   ├── panels/
│   └── provisioning/
│
├── 04-alerting/
│   ├── alert-rules/
│   ├── alertmanager/
│   ├── routing/
│   ├── silences/
│   └── notification-channels/
│
├── 05-linux-monitoring/
│   ├── node-exporter/
│   ├── cpu/
│   ├── memory/
│   ├── disk/
│   └── network/
│
├── 06-kubernetes/
│   ├── kube-state-metrics/
│   ├── node-monitoring/
│   ├── pod-monitoring/
│   ├── kube-prometheus-stack/
│   └── kubernetes-alerts/
│
├── 07-real-world-labs/
│   ├── high-cpu/
│   ├── memory-leak/
│   ├── disk-full/
│   ├── high-latency/
│   ├── pod-crashloop/
│   └── service-down/
│
└── 08-projects/
    ├── linux-observability/
    ├── kubernetes-observability/
    └── production-monitoring-stack/
```

---

## 🧪 How Every Lab Works

Each lesson is designed to turn theory into operational skill.

```text
📖 CONCEPT
    ↓
🛠️ BUILD
    ↓
🔎 QUERY WITH PROMQL
    ↓
📊 VISUALIZE IN GRAFANA
    ↓
💥 INTRODUCE A FAILURE
    ↓
🚨 OBSERVE THE SIGNAL
    ↓
🔍 TROUBLESHOOT THE ROOT CAUSE
    ↓
📝 DOCUMENT THE FIX
```

This approach is intentionally closer to how monitoring is used in real DevOps/SRE environments.

---

## 🔥 Real-World Incident Labs

The final learning stages focus on scenarios that force you to investigate rather than simply follow a tutorial.

| Incident | Investigation focus |
|---|---|
| 🔥 High CPU | CPU saturation, processes, rates and capacity |
| 🧠 Memory Leak | Memory growth, working set and pressure |
| 💾 Disk Full | Filesystem usage, inode pressure and cleanup |
| 🐢 High Latency | Request duration, histograms and percentiles |
| ☠️ Pod CrashLoop | Restart counters, pod state and events |
| 🔌 Service Down | Target health, availability and alerting |

---

## 🧰 Technology Stack

<div align="center">

| Category | Tools |
|---|---|
| Metrics | Prometheus, Node Exporter |
| Querying | PromQL |
| Visualization | Grafana |
| Alerting | Prometheus Alert Rules, Alertmanager |
| Kubernetes | Kubernetes, kube-state-metrics |
| Packaging | Helm |
| Local Labs | Docker, Docker Compose |
| Operations | Linux, troubleshooting, runbooks |

</div>

---

## ⚡ Quick Start

Start with the existing local Prometheus + Node Exporter lab:

```bash
git clone https://github.com/RahulSinha9/prometheus-grafana-zero-to-hero.git
cd prometheus-grafana-zero-to-hero
```

Then enter the first practical Prometheus lab and follow its local setup instructions.

> 💡 **Tip:** Work through the repository in order. The later Kubernetes and incident labs assume you understand the earlier Prometheus and PromQL concepts.

---

## 📈 Learning Progress

### Foundations

- [ ] Observability basics
- [ ] Metrics, labels and metric types
- [ ] Prometheus architecture

### Prometheus

- [ ] Installation
- [ ] Configuration
- [ ] Scrape targets
- [ ] Service discovery
- [ ] Exporters

### PromQL

- [ ] Selectors
- [ ] Aggregations
- [ ] `rate()` and `increase()`
- [ ] Histograms
- [ ] Vector matching and joins
- [ ] Recording rules

### Grafana & Alerting

- [ ] Prometheus datasource
- [ ] Dashboards and panels
- [ ] Variables
- [ ] Provisioning
- [ ] Alert rules
- [ ] Alertmanager
- [ ] Routing and silences
- [ ] Notification channels

### Infrastructure & Kubernetes

- [ ] Node Exporter
- [ ] CPU / memory / disk / network monitoring
- [ ] kube-state-metrics
- [ ] Node monitoring
- [ ] Pod monitoring
- [ ] kube-prometheus-stack
- [ ] Kubernetes alerts

### Incident Response

- [ ] High CPU
- [ ] Memory leak
- [ ] Disk full
- [ ] High latency
- [ ] Pod CrashLoopBackOff
- [ ] Service down

### Capstone

- [ ] Linux observability project
- [ ] Kubernetes observability project
- [ ] Production monitoring stack

---

## 🧠 What You Should Be Able to Do Afterward

By the end, you should be able to:

- Explain how Prometheus collects and stores metrics.
- Design useful metric names and labels without unnecessary cardinality.
- Write practical PromQL queries for investigation.
- Build Grafana dashboards that answer operational questions.
- Create meaningful alerts instead of noisy thresholds.
- Configure Alertmanager routing and silences.
- Monitor Linux hosts and Kubernetes workloads.
- Investigate failures using metrics and time-series evidence.
- Build recording rules for frequently used or expensive queries.
- Assemble a production-style monitoring stack and document its operational runbooks.

---

## 🏆 Portfolio Projects

### 1. 🐧 Linux Observability

Build a complete Linux monitoring environment using Prometheus, Node Exporter and Grafana.

**Focus:** infrastructure metrics, dashboards, alerts and troubleshooting.

### 2. ☸️ Kubernetes Observability

Monitor a Kubernetes cluster using Prometheus, Grafana and kube-state-metrics.

**Focus:** nodes, namespaces, pods, workloads, resource usage and cluster alerts.

### 3. 🚀 Production Monitoring Stack

Bring the complete journey together into a production-style observability platform.

**Focus:** dashboards, alerting, recording rules, incident scenarios, runbooks and operational practices.

---

## 📚 Official Documentation

- [Prometheus Documentation](https://prometheus.io/docs/)
- [PromQL Basics](https://prometheus.io/docs/prometheus/latest/querying/basics/)
- [Grafana Documentation](https://grafana.com/docs/)
- [Alertmanager Documentation](https://prometheus.io/docs/alerting/latest/alertmanager/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Helm Documentation](https://helm.sh/docs/)

---

## 🤝 Learning Philosophy

This is not intended to be a collection of copied configuration snippets.

The objective is to build **operational intuition**:

> **When something breaks, can you look at the signals, form a hypothesis, prove it with data, and explain the fix?**

If the answer becomes **yes**, you're moving from learning monitoring tools to thinking like an observability engineer.

---

## ⭐ Project Status

```text
🚧 Active Learning Project

Foundations        ██████████░░  Building
Prometheus         ████████░░░░  Building
PromQL             ██████░░░░░░  Building
Grafana            █████░░░░░░░  Building
Alerting           ████░░░░░░░░  Building
Linux Monitoring   ███░░░░░░░░░  Building
Kubernetes         ██░░░░░░░░░░  Building
Incident Labs      ██░░░░░░░░░░  Building
Projects           █░░░░░░░░░░░  Planned
```

**Built incrementally with real labs, practical failures and production-oriented patterns.**

---

<div align="center">

### ⭐ Star the repository if you're learning observability too.

**Prometheus + Grafana → Zero to Hero 🚀**

</div>
