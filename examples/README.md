# Hands-on Examples — Beginner Friendly Implementation Guide

This folder is the **practical lab area** of the repository. The goal is simple: you should be able to open an example, understand what every file does, copy the commands, run the lab, verify the result, intentionally break something, and fix it.

> **Learning rule:** do not only read the code. Type it, run it, change it, observe what happens, and explain it back in your own words.

Prometheus collects metrics by scraping HTTP endpoints, stores them as time series, and lets you query them with PromQL. Grafana can connect to Prometheus as a data source and turn those queries into dashboards and alerts. citeturn0search3turn0search2turn0search5

---

## 1. How to use this folder

For every example, follow this order:

1. **Read the goal** — understand what problem we are solving.
2. **Check prerequisites** — install only what the lab needs.
3. **Understand the architecture** — know where data is coming from and where it goes.
4. **Read the files** — understand the syntax before running anything.
5. **Start the services** — use the provided commands.
6. **Verify each layer** — do not assume that a running container means monitoring is working.
7. **Run the query** — confirm that Prometheus actually has the expected metric.
8. **Visualize it** — connect Grafana and create a panel when applicable.
9. **Create an alert** — turn an important condition into an actionable signal.
10. **Break the lab** — stop a target, change a port, or introduce a configuration mistake.
11. **Troubleshoot** — use evidence instead of guessing.
12. **Clean up** — remove containers/processes when finished.

---

## 2. Big picture: what are we building?

A beginner can think about the stack like this:

```text
                    YOUR SERVER / APP
                           │
                           │ exposes metrics
                           ▼
                    ┌──────────────┐
                    │ Node Exporter│
                    │ /metrics     │
                    └──────┬───────┘
                           │
                           │ HTTP scrape
                           ▼
                    ┌──────────────┐
                    │  Prometheus  │
                    │ stores data  │
                    └──────┬───────┘
                           │
                    PromQL queries
                           │
                 ┌─────────┴─────────┐
                 ▼                   ▼
          ┌────────────┐      ┌──────────────┐
          │   Grafana  │      │ Alert Rules  │
          │ dashboards │      │              │
          └────────────┘      └──────┬───────┘
                                      │
                                      ▼
                               ┌─────────────┐
                               │ Alertmanager│
                               └─────────────┘
```

### In simple words

- **Exporter/application:** exposes information such as CPU, memory or request count.
- **Prometheus:** visits the metrics endpoint and saves the values.
- **PromQL:** asks questions about the saved metrics.
- **Grafana:** turns query results into graphs, tables and dashboards.
- **Alert rules:** continuously check whether an important condition is true.
- **Alertmanager:** groups and routes alerts to notification receivers.

Prometheus's official first-steps guide uses the same basic model: configure scrape targets, run Prometheus, and query collected metrics. citeturn0search3

---

# 3. Example directory map

```text
examples/
├── 01-prometheus/
│   └── Prometheus installation and scraping examples
├── 02-promql/
│   └── PromQL syntax and practical queries
├── 03-alerting/
│   └── Alert rules and Alertmanager examples
├── 04-recording-rules/
│   └── Precomputed PromQL examples
├── 05-grafana/
│   └── Datasources, dashboards and provisioning
├── 06-linux-monitoring/
│   └── CPU, memory, disk and network monitoring
├── 07-kubernetes/
│   └── Kubernetes monitoring examples
├── CODE-GUIDE.md
│   └── Syntax-focused reference
└── README.md
    └── This implementation guide
```

---

# 4. Lab 01 — Start with Prometheus

## What are we trying to do?

We want Prometheus to monitor itself.

Prometheus normally listens on port `9090`. Its own `/metrics` endpoint exposes metrics that another Prometheus instance could scrape. The official getting-started tutorial uses this as the first monitoring example. citeturn0search3

## Step 1 — Create a configuration file

Create `prometheus.yml`:

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets:
          - "localhost:9090"
```

### Understand the YAML

```yaml
global:
```

This contains settings that apply globally.

```yaml
scrape_interval: 15s
```

Prometheus asks its targets for metrics every 15 seconds.

```yaml
scrape_configs:
```

This section tells Prometheus **what it should monitor**.

```yaml
job_name: prometheus
```

This gives the target group a readable name.

```yaml
targets:
  - "localhost:9090"
```

This tells Prometheus where the metrics endpoint is located.

Prometheus configuration files use YAML, and `scrape_configs` defines scraping jobs and their targets. citeturn0search15turn0search3

## Step 2 — Start Prometheus

```bash
./prometheus --config.file=prometheus.yml
```

## Step 3 — Open Prometheus

Open:

```text
http://localhost:9090
```

Then open the query page.

## Step 4 — Run your first query

```promql
up
```

You should see a value of `1` for a healthy scraped target.

### What does `up` mean?

`up` is a metric Prometheus creates for scrape targets:

```text
1 = scrape succeeded
0 = scrape failed
```

This is one of the first metrics you should learn when troubleshooting Prometheus.

---

# 5. PromQL — learn the syntax slowly

PromQL is Prometheus's query language. It selects and aggregates time-series data. citeturn0search2

## 5.1 Select one metric

```promql
up
```

Meaning:

> Give me the current `up` time series.

## 5.2 Filter using a label

```promql
up{job="prometheus"}
```

Meaning:

> Give me `up` only where the `job` label equals `prometheus`.

## 5.3 Filter using a different operator

```promql
up{job!="prometheus"}
```

Meaning:

> Give me targets whose `job` is not `prometheus`.

## 5.4 Regular-expression matching

```promql
up{job=~"node.*"}
```

Meaning:

> Match jobs beginning with `node`.

## 5.5 Calculate a rate

For a counter metric:

```promql
rate(http_requests_total[5m])
```

Read this from the inside out:

1. `http_requests_total` = metric.
2. `[5m]` = look at the previous five minutes.
3. `rate(...)` = calculate the per-second increase rate.

## 5.6 Aggregate values

```promql
sum(rate(http_requests_total[5m]))
```

Meaning:

> Calculate request rate for each series and then add them together.

## 5.7 Group by a label

```promql
sum by (job) (
  rate(http_requests_total[5m])
)
```

Meaning:

> Calculate request rate and produce one result for each `job`.

---

# 6. Linux CPU example

A common infrastructure question is:

> What percentage of CPU is being used?

With Node Exporter metrics, a common calculation starts from CPU seconds in the `idle` mode.

Example:

```promql
100 * (1 - avg by(instance) (
  rate(node_cpu_seconds_total{mode="idle"}[5m])
))
```

### Understand the calculation

```promql
node_cpu_seconds_total{mode="idle"}
```

Select CPU time spent idle.

```promql
rate(...[5m])
```

Calculate the recent rate of change.

```promql
avg by(instance)(...)
```

Average across CPU cores for each instance.

```promql
1 - idle
```

Convert idle proportion into used proportion.

```promql
100 * (...)
```

Convert the proportion into a percentage.

This is more useful than memorizing the final query because you can rebuild it when the metric names or grouping requirements change.

---

# 7. Grafana implementation

Grafana uses data sources to connect to systems such as Prometheus and then uses queries to build visualizations. A dashboard is made from panels that query and visualize data. citeturn0search5turn0search4

## Step 1 — Start Grafana

Install or start Grafana using the method appropriate for your operating system.

Open:

```text
http://localhost:3000
```

## Step 2 — Add Prometheus as a data source

In Grafana:

```text
Connections
   ↓
Data sources
   ↓
Add data source
   ↓
Prometheus
```

For a local Prometheus server, the URL will commonly be:

```text
http://localhost:9090
```

Click **Save & Test**.

## Step 3 — Create a panel

Create a dashboard and add a visualization panel.

Use:

```promql
up
```

Choose a suitable visualization such as **Time series** or **Stat**.

Grafana's documentation describes the same workflow: connect a data source, run a query, and turn the result into a panel. citeturn0search6

---

# 8. Alert example

Suppose a server becomes unreachable.

We can create an alert based on:

```promql
up == 0
```

Example rule:

```yaml
groups:
  - name: infrastructure
    rules:
      - alert: TargetDown
        expr: up == 0
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "Monitoring target is down"
          description: "The target {{ $labels.instance }} has been unreachable for 5 minutes."
```

### Understand the rule

`alert:`

The name of the alert.

`expr:`

The PromQL expression that decides whether the alert condition is true.

`for:`

The condition must remain true for five minutes before the alert becomes firing.

`labels:`

Additional metadata used for routing and grouping.

`annotations:`

Human-readable information shown with the alert.

---

# 9. Recording rules

Sometimes a PromQL query is complex and used repeatedly.

Instead of calculating the same expensive query every time, create a recording rule.

```yaml
groups:
  - name: recording-rules
    interval: 30s
    rules:
      - record: instance:cpu_usage:ratio
        expr: |
          1 - avg by(instance) (
            rate(node_cpu_seconds_total{mode="idle"}[5m])
          )
```

Then query the recorded metric:

```promql
instance:cpu_usage:ratio
```

The important learning point is that the rule gives a complicated expression a reusable metric name.

---

# 10. Kubernetes example

For Kubernetes, the learning process should be:

```text
Kubernetes objects
       ↓
Kube-state-metrics / node metrics / application metrics
       ↓
Prometheus
       ↓
PromQL
       ↓
Grafana
       ↓
Alerts
```

Example commands to investigate a pod:

```bash
kubectl get pods -A
kubectl get pods -A -o wide
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace>
kubectl get events -n <namespace> --sort-by=.lastTimestamp
```

If a pod is in `CrashLoopBackOff`, do not immediately restart it repeatedly. First inspect:

```bash
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace> --previous
```

Then identify whether the problem is configuration, image, permissions, resources, probes, dependencies, or application code.

---

# 11. Failure simulation — learn by breaking things

Monitoring becomes much easier when you practice incidents.

## Target-down exercise

1. Start Prometheus.
2. Confirm `up == 1`.
3. Stop the monitored exporter.
4. Wait for the next scrape.
5. Run:

```promql
up
```

6. Confirm the target changes to `0`.
7. Investigate Prometheus target status.
8. Start the exporter again.
9. Confirm the target returns to `1`.

### What you learned

You did not just learn the `up` metric. You learned the complete operational cycle:

```text
Healthy
  ↓
Failure
  ↓
Detection
  ↓
Investigation
  ↓
Recovery
  ↓
Verification
```

---

# 12. Troubleshooting method

When something does not work, use this order.

### Layer 1 — Is the process running?

```bash
ps aux | grep prometheus
```

or:

```bash
docker ps
```

### Layer 2 — Is the port listening?

```bash
ss -lntp
```

### Layer 3 — Can the metrics endpoint be reached?

```bash
curl http://localhost:9090/metrics
```

For an exporter:

```bash
curl http://localhost:9100/metrics
```

### Layer 4 — Does Prometheus know the target?

Check the Targets page.

### Layer 5 — Is `up` healthy?

```promql
up
```

### Layer 6 — Does the expected metric exist?

Search for the metric in Prometheus.

### Layer 7 — Is the PromQL query correct?

Start simple:

```promql
up
```

Then add filters:

```promql
up{job="node"}
```

Then calculations:

```promql
rate(metric_total[5m])
```

This prevents you from debugging five different layers at the same time.

---

# 13. Beginner exercises

### Exercise 1 — Find your targets

Run:

```promql
up
```

Answer:

- How many targets are there?
- Which targets are healthy?
- Which targets are failing?
- What labels identify them?

### Exercise 2 — Change the scrape interval

Change:

```yaml
scrape_interval: 15s
```

to:

```yaml
scrape_interval: 30s
```

Reload/restart Prometheus and explain what changed.

### Exercise 3 — Write a filtered query

Find all targets for a specific job:

```promql
up{job="prometheus"}
```

Then try another job from your environment.

### Exercise 4 — Break the target

Change the target port to an incorrect value:

```yaml
targets:
  - "localhost:9999"
```

Observe the failure.

Then restore the correct port and verify recovery.

### Exercise 5 — Build a dashboard

Create panels for:

```promql
up
```

and, where Node Exporter is available:

```promql
rate(node_cpu_seconds_total{mode="idle"}[5m])
```

---

# 14. Intermediate exercises

1. Create a CPU usage recording rule.
2. Create a `TargetDown` alert.
3. Add a severity label.
4. Route critical alerts differently in Alertmanager.
5. Build a dashboard with CPU, memory, disk and network panels.
6. Add dashboard variables for `instance` and `job`.
7. Intentionally stop Node Exporter and observe the alert lifecycle.
8. Investigate a failed scrape using the target page and logs.

---

# 15. Advanced exercises

Build a small production-style monitoring stack containing:

```text
Prometheus
+ Node Exporter
+ Grafana
+ Alertmanager
+ Recording Rules
+ Alert Rules
+ Kubernetes metrics
```

Then simulate:

- CPU saturation
- Memory pressure
- Disk exhaustion
- Service outage
- Pod CrashLoopBackOff
- High request latency

For each incident, record:

```text
Incident
→ Detection signal
→ PromQL query
→ Evidence
→ Root cause
→ Recovery action
→ Verification
→ Preventive action
```

---

# 16. What “good” implementation looks like

A finished example should not merely say:

> “Create a Prometheus configuration.”

It should teach:

```text
WHY are we creating it?
        ↓
WHAT does each field mean?
        ↓
HOW do we create it?
        ↓
HOW do we run it?
        ↓
HOW do we verify it?
        ↓
WHAT does failure look like?
        ↓
HOW do we troubleshoot it?
        ↓
HOW would we improve it for production?
```

That is the standard to follow for every example in this directory.

---

# 17. Recommended learning progression

| Level | Learn | Main outcome |
|---|---|---|
| Beginner | Metrics, targets, YAML, `up` | Understand basic monitoring |
| Beginner | Selectors and labels | Write simple PromQL |
| Intermediate | `rate`, aggregation, histograms | Analyze real metrics |
| Intermediate | Grafana | Build dashboards |
| Intermediate | Alert rules | Detect problems automatically |
| Intermediate | Alertmanager | Route notifications |
| Advanced | Recording rules | Optimize repeated queries |
| Advanced | Kubernetes monitoring | Monitor clusters |
| Advanced | Incident labs | Troubleshoot real failures |
| Production | Full stack | Design an operational monitoring system |

---

# 18. Important habit

Never memorize a PromQL query without understanding it.

For example, instead of memorizing:

```promql
100 * (1 - avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])))
```

learn the pieces:

```text
metric
  ↓
label filter
  ↓
range vector
  ↓
rate()
  ↓
aggregation
  ↓
mathematical conversion
  ↓
percentage
```

Once you understand the pieces, you can build new queries yourself.

---

# 19. Completion checklist

- [ ] I can explain what a metric is.
- [ ] I understand labels.
- [ ] I can explain how Prometheus scrapes a target.
- [ ] I can read a `prometheus.yml` file.
- [ ] I can find a failed target.
- [ ] I can use `up`.
- [ ] I can write label selectors.
- [ ] I understand counters and `rate()`.
- [ ] I can aggregate metrics.
- [ ] I understand histograms at a basic level.
- [ ] I can connect Grafana to Prometheus.
- [ ] I can create a Grafana panel.
- [ ] I can write an alert rule.
- [ ] I understand Alertmanager routing.
- [ ] I can create a recording rule.
- [ ] I can troubleshoot a failed scrape.
- [ ] I can troubleshoot a Kubernetes monitoring problem.
- [ ] I can perform a complete failure simulation.

---

## Official references

- Prometheus first steps: https://prometheus.io/docs/prometheus/latest/getting_started/
- Prometheus configuration: https://prometheus.io/docs/prometheus/latest/configuration/configuration/
- PromQL basics: https://prometheus.io/docs/prometheus/latest/querying/basics/
- Grafana getting started: https://grafana.com/docs/grafana/latest/fundamentals/getting-started/
- Grafana data sources: https://grafana.com/docs/learning-hub/intro-to-data-sources/
- Grafana dashboards: https://grafana.com/docs/grafana-cloud/learn-and-build/visualizations/dashboards/
