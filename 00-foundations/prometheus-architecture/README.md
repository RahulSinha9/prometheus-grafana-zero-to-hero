# Prometheus Architecture

## 🎯 Goal
Understand the complete Prometheus data path from target discovery to storage, querying, rules, and alert delivery.

## Architecture

```text
Targets / Exporters
       │
       ▼
 Service Discovery
       │
       ▼
    Scraper
       │
       ▼
 Local TSDB
   │       │
   ▼       ▼
 PromQL   Rules
   │       │
   ▼       ▼
Grafana  Alertmanager
```

## Core components

- **Prometheus server:** discovers targets, scrapes metrics, stores samples, evaluates rules, and serves PromQL.
- **Exporters:** expose metrics for systems that do not natively expose Prometheus metrics.
- **TSDB:** stores time-series samples locally.
- **PromQL:** queries and transforms stored series.
- **Rule engine:** evaluates recording and alerting rules.
- **Alertmanager:** groups, routes, silences, and sends alerts.

## Pull model
Prometheus normally pulls `/metrics` from targets. Learn why this makes target reachability, service discovery, scrape intervals, and endpoint correctness important.

## Service discovery and relabeling
Understand the difference between discovered metadata and the labels finally attached to targets. Practice relabeling without accidentally dropping required targets.

## Storage and retention
Learn that local Prometheus storage is optimized for recent operational data. Study retention, disk sizing, WAL behavior, backups, and remote-write architectures before designing long-term storage.

## 🧪 Labs
1. Draw the architecture from memory.
2. Add one exporter.
3. Break the exporter and inspect `up`.
4. Query the target with PromQL.
5. Add a recording rule.
6. Add an alert and route it through Alertmanager.

## 🔍 Design questions
- What happens if Prometheus cannot reach a target?
- What happens if Prometheus disk fills?
- Which component owns notification routing?
- When would you need remote storage?

## ✅ Completion
- [ ] Explain scrape flow.
- [ ] Explain TSDB role.
- [ ] Explain rule evaluation.
- [ ] Explain Alertmanager's role.
- [ ] Explain service discovery and relabeling.