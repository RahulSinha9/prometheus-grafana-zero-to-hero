# 01 — Prometheus

Learn how to install, configure, operate, and troubleshoot Prometheus as a production metrics collector.

## 🎯 Module Goal

By the end of this module, you should be able to run Prometheus, configure scrape jobs, understand target health, use service discovery, and integrate exporters.

## 📚 Learning Path

### Installation

Learn the common deployment models:

- Linux binary installation
- Docker / Docker Compose
- Kubernetes
- Helm-based deployment

Understand the Prometheus process, configuration file, storage directory, web UI, and lifecycle commands.

### Configuration

Study `prometheus.yml` and the most important settings:

- `global.scrape_interval`
- `global.evaluation_interval`
- `scrape_configs`
- `static_configs`
- `rule_files`
- `alerting`
- `remote_write`

Example:

```yaml
scrape_configs:
  - job_name: node
    static_configs:
      - targets: ["node-exporter:9100"]
```

### Scrape Targets

Learn how Prometheus discovers and scrapes HTTP endpoints. Practice reading the **Status → Targets** page and diagnosing `UP` versus `DOWN` targets.

Key concepts:

- Scrape interval
- Scrape timeout
- Target labels
- `up` metric
- Scrape errors
- Exporter endpoints

### Service Discovery

Move from manually maintained target lists to dynamic discovery. Explore common approaches such as:

- Kubernetes service discovery
- EC2 discovery
- File-based discovery
- DNS-based discovery

Understand relabeling and why discovery metadata is often transformed before scraping.

### Exporters

Learn why exporters are used when an application or system does not expose Prometheus metrics directly.

Examples:

- Node Exporter — Linux host metrics
- Blackbox Exporter — endpoint probing
- kube-state-metrics — Kubernetes object state
- Application-specific exporters

## 🧪 Hands-On Labs

- Run Prometheus with Docker Compose.
- Add Node Exporter as a scrape target.
- Break a target intentionally and diagnose it.
- Change the scrape interval and observe the effect.
- Add a second scrape job.
- Use relabeling to add environment metadata.
- Compare static discovery with dynamic discovery.

## 🔍 Troubleshooting Checklist

```text
Target DOWN?
   │
   ├── Can Prometheus resolve the hostname?
   ├── Is the target port reachable?
   ├── Does /metrics return HTTP 200?
   ├── Is the scrape path correct?
   ├── Did Prometheus load the configuration?
   └── Check Status → Targets and Prometheus logs
```

## ✅ Completion Checklist

- [ ] Install Prometheus locally.
- [ ] Understand `prometheus.yml`.
- [ ] Configure scrape jobs.
- [ ] Read target health information.
- [ ] Use `up` and scrape metrics for troubleshooting.
- [ ] Understand service discovery.
- [ ] Understand exporters.
- [ ] Diagnose a failed scrape.

## 🚀 Next Step

Continue to [`02-promql`](../02-promql/) and learn how to query, aggregate, transform, and analyze Prometheus data.