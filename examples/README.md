# Hands-on Code Examples

This directory is the **implementation lab** for the Prometheus + Grafana Zero to Hero course. The goal is not only to read syntax, but to understand how the pieces are installed, configured, connected, tested, broken, debugged, and operated.

Prometheus uses YAML configuration for scrape jobs, rule files, and Alertmanager integration; alerting is split between Prometheus alert rules and Alertmanager notification/routing responsibilities. citeturn0search2turn0search4turn0search1

## Learning Method

Use every example in this order:

1. **Read** the explanation and identify the component being configured.
2. **Inspect** every configuration field before running it.
3. **Implement** the example exactly once.
4. **Run** the services or commands.
5. **Verify** the result using HTTP endpoints, CLI commands, PromQL, or Kubernetes commands.
6. **Modify** one value and observe what changes.
7. **Break** one part intentionally.
8. **Troubleshoot** using logs, status endpoints, metrics, and configuration validation.
9. **Document** what you learned.
10. **Repeat** the exercise without looking at the solution.

## Example Roadmap

| Directory | What you will implement |
|---|---|
| `01-prometheus` | Prometheus installation, YAML configuration, scrape targets and exporters |
| `02-promql` | PromQL syntax, selectors, aggregation, rates, histograms and joins |
| `03-alerting` | Alert rules, Alertmanager, routing, grouping and notification concepts |
| `04-recording-rules` | Precomputed PromQL queries and reusable recording rules |
| `05-grafana` | Datasources, dashboards, panels, variables and provisioning |
| `06-linux-monitoring` | Node Exporter, CPU, memory, disk and network monitoring |
| `07-kubernetes` | Kubernetes metrics, kube-state-metrics, pod/node monitoring and alerts |

---

# 01 — Prometheus Implementation

## Objective

Build a small monitoring stack in which Prometheus scrapes its own metrics and Node Exporter metrics.

### Architecture

```text
Node Exporter :9100
       │
       │ /metrics
       ▼
Prometheus :9090
       │
       ├── PromQL
       └── Rules
```

## Step 1 — Prepare the workspace

```bash
mkdir prometheus-lab
cd prometheus-lab
mkdir -p rules
```

## Step 2 — Create `prometheus.yml`

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

rule_files:
  - "rules/*.yml"

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node"
    static_configs:
      - targets: ["localhost:9100"]
```

### What each section means

- `global.scrape_interval` controls how frequently Prometheus collects samples.
- `evaluation_interval` controls how frequently rules are evaluated.
- `rule_files` loads alerting and recording rules.
- `scrape_configs` defines monitoring jobs.
- `job_name` becomes the `job` label.
- `targets` identifies the endpoints Prometheus should scrape.

## Step 3 — Run Prometheus

Example native execution:

```bash
./prometheus \
  --config.file=prometheus.yml \
  --web.enable-lifecycle
```

The lifecycle flag allows configuration reload through the reload endpoint. Prometheus documents `/-/reload` for runtime configuration reload when lifecycle support is enabled. citeturn0search2

## Step 4 — Verify Prometheus

```bash
curl http://localhost:9090/-/ready
curl http://localhost:9090/api/v1/status/config
```

Open the Prometheus expression browser and test:

```promql
up
```

Then:

```promql
up{job="prometheus"}
```

And:

```promql
up{job="node"}
```

A healthy target normally produces a value of `1`; a failed scrape produces `0`.

## Step 5 — Inspect targets

Open:

```text
http://localhost:9090/targets
```

Check:

- endpoint
- state
- last scrape
- scrape duration
- error message

## Step 6 — Break the configuration

Change:

```yaml
targets: ["localhost:9100"]
```

to an invalid port:

```yaml
targets: ["localhost:9199"]
```

Reload and query:

```promql
up{job="node"}
```

Expected learning result: the target should become unhealthy. Do not treat a failed target as an application outage automatically; first determine whether the scrape endpoint itself is reachable.

---

# 02 — PromQL Syntax Lab

PromQL is the query language used to select, transform, aggregate and calculate values from Prometheus time series.

## Basic metric selector

```promql
up
```

## Label selector

```promql
up{job="node"}
```

## Multiple labels

```promql
up{job="node", instance="localhost:9100"}
```

## Negative match

```promql
up{job!="prometheus"}
```

## Regular expression match

```promql
up{job=~"node|prometheus"}
```

## Regular expression negative match

```promql
up{job!~"test.*"}
```

## Range vector

```promql
up[5m]
```

A range selector supplies historical samples to functions such as `rate()`.

## Counter rate

```promql
rate(node_cpu_seconds_total[5m])
```

## CPU utilization

```promql
100 * (1 - avg by(instance) (
  rate(node_cpu_seconds_total{mode="idle"}[5m])
))
```

## Aggregation

```promql
sum by(job) (up)
```

```promql
count by(job) (up)
```

```promql
avg by(instance) (up)
```

## Histogram percentile

```promql
histogram_quantile(
  0.95,
  sum by(le) (
    rate(http_request_duration_seconds_bucket[5m])
  )
)
```

## Learning exercise

For each query, answer:

1. What metric is selected?
2. What labels are filtered?
3. Is the result an instant or range vector?
4. Is a function being applied?
5. Is aggregation changing the label set?
6. What operational question does the query answer?

---

# 03 — Prometheus Alerting + Alertmanager

Prometheus evaluates alerting rules. Alertmanager then handles grouping, routing, silencing, inhibition and notification delivery. citeturn0search4turn0search1

## Step 1 — Create an alert rule

Create `rules/node.yml`:

```yaml
groups:
  - name: node-alerts
    rules:
      - alert: NodeExporterDown
        expr: up{job="node"} == 0
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: "Node Exporter is unavailable"
          description: "Node Exporter on {{ $labels.instance }} has been unavailable for more than 2 minutes."
```

## Step 2 — Validate the rule

Use Prometheus rule validation tooling appropriate to the installed version, then check the Prometheus `/rules` and `/alerts` pages after loading the rule.

## Step 3 — Configure Alertmanager connection

Add to `prometheus.yml`:

```yaml
alerting:
  alertmanagers:
    - static_configs:
        - targets:
            - "localhost:9093"
```

## Step 4 — Create basic Alertmanager configuration

```yaml
global:
  resolve_timeout: 5m

route:
  receiver: "default"
  group_by:
    - alertname
    - instance

receivers:
  - name: "default"
```

Alertmanager's routing tree determines how alerts are grouped and which receiver handles them. citeturn0search0

## Step 5 — Start Alertmanager

```bash
./alertmanager --config.file=alertmanager.yml
```

Verify:

```bash
curl http://localhost:9093/-/ready
```

## Step 6 — Trigger the alert

Stop Node Exporter or point the target at an unreachable endpoint.

Query:

```promql
up{job="node"}
```

Then inspect the alert in Prometheus and Alertmanager.

## Step 7 — Learn routing

Example severity-based routing:

```yaml
route:
  receiver: "default"
  routes:
    - matchers:
        - severity="critical"
      receiver: "critical"

receivers:
  - name: "default"

  - name: "critical"
```

For production integrations, keep credentials and webhook URLs out of Git. Alertmanager supports multiple notification integrations. citeturn0search10

---

# 04 — Recording Rules

Recording rules precompute frequently used expressions and store the result as a new time series.

## Example

```yaml
groups:
  - name: node-recording
    interval: 30s
    rules:
      - record: instance:node_cpu_utilization:ratio
        expr: |
          1 - avg by(instance) (
            rate(node_cpu_seconds_total{mode="idle"}[5m])
          )
```

Then query:

```promql
instance:node_cpu_utilization:ratio
```

## Why use them?

Use recording rules when:

- the same expensive query is used repeatedly;
- dashboards need predictable query performance;
- alert rules should use a stable precomputed signal;
- a complex expression should receive a clear metric name.

## Exercise

Create recording rules for:

- CPU utilization
- memory utilization
- filesystem utilization
- request rate
- request error rate

---

# 05 — Grafana Implementation

## Objective

Connect Grafana to Prometheus and build a dashboard from PromQL.

## Step 1 — Add Prometheus datasource

For a local Grafana instance, the datasource URL might be:

```text
http://prometheus:9090
```

If both applications run directly on the host, it may instead be:

```text
http://localhost:9090
```

Use the address reachable **from the Grafana process**, not necessarily from your browser.

## Step 2 — Test the datasource

Run:

```promql
up
```

The datasource test should succeed before creating dashboards.

## Step 3 — Create dashboard panels

Useful starter panels:

### Target health

```promql
up
```

### CPU

```promql
100 * (1 - avg by(instance) (
  rate(node_cpu_seconds_total{mode="idle"}[5m])
))
```

### Memory

```promql
100 * (
  1 - node_memory_MemAvailable_bytes
      / node_memory_MemTotal_bytes
)
```

### Filesystem

```promql
100 * (
  1 - node_filesystem_avail_bytes{fstype!~"tmpfs|overlay"}
      / node_filesystem_size_bytes{fstype!~"tmpfs|overlay"}
)
```

## Step 4 — Add a variable

A common instance variable query is:

```promql
label_values(up, instance)
```

Then use it in a panel:

```promql
up{instance="$instance"}
```

---

# 06 — Linux Monitoring

## CPU investigation

```bash
uptime
nproc
top
mpstat -P ALL 1
```

PromQL:

```promql
100 * (1 - avg by(instance) (
  rate(node_cpu_seconds_total{mode="idle"}[5m])
))
```

## Memory investigation

```bash
free -h
vmstat 1
ps aux --sort=-%mem | head
```

PromQL:

```promql
node_memory_MemAvailable_bytes
```

## Disk investigation

```bash
df -h
lsblk
du -xh /var 2>/dev/null | sort -h | tail
```

PromQL:

```promql
100 * (
  1 - node_filesystem_avail_bytes
      / node_filesystem_size_bytes
)
```

## Network investigation

```bash
ip -s link
ss -s
ss -tulpen
```

The learning goal is to correlate Linux evidence with Prometheus metrics instead of looking at a dashboard in isolation.

---

# 07 — Kubernetes Monitoring

## Step 1 — Verify cluster access

```bash
kubectl cluster-info
kubectl get nodes
kubectl get pods -A
```

## Step 2 — Inspect pod state

```bash
kubectl get pods -A
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace>
```

## Step 3 — Check resource usage

```bash
kubectl top nodes
kubectl top pods -A
```

## Step 4 — Deploy a test workload

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: demo-app
  template:
    metadata:
      labels:
        app: demo-app
    spec:
      containers:
        - name: nginx
          image: nginx:stable
          ports:
            - containerPort: 80
```

Apply it:

```bash
kubectl apply -f deployment.yaml
kubectl get deployment demo-app
kubectl get pods -l app=demo-app
```

## Step 5 — Simulate a failure

Scale down:

```bash
kubectl scale deployment demo-app --replicas=0
```

Observe the monitoring impact, then recover:

```bash
kubectl scale deployment demo-app --replicas=2
```

## Step 6 — Investigate CrashLoopBackOff

```bash
kubectl get pods -A
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace> --previous
kubectl get events -n <namespace> --sort-by=.lastTimestamp
```

The important operational sequence is:

```text
Symptom
  ↓
Prometheus/Grafana signal
  ↓
Identify affected workload
  ↓
kubectl describe
  ↓
logs / events
  ↓
Find root cause
  ↓
Fix
  ↓
Verify recovery
```

---

# Validation Checklist

Before considering an example complete, confirm:

- [ ] Configuration syntax is valid.
- [ ] Services start successfully.
- [ ] Targets are visible in Prometheus.
- [ ] `up` returns expected values.
- [ ] PromQL query returns the expected series.
- [ ] Grafana datasource connects successfully.
- [ ] Dashboard panels display data.
- [ ] Alert rules are loaded.
- [ ] Alerts can transition between inactive, pending and firing states.
- [ ] Alertmanager receives firing alerts.
- [ ] Routing behavior is understood.
- [ ] Failure recovery has been tested.
- [ ] Secrets have not been committed.

# Troubleshooting Workflow

When something does not work, do not immediately change multiple settings.

Use this sequence:

```text
1. Is the process running?
2. Is the endpoint reachable?
3. Is the configuration valid?
4. Is the target discovered?
5. Is the target UP?
6. Are samples being ingested?
7. Does the PromQL query return data?
8. Is Grafana querying the correct datasource?
9. Is the alert expression true?
10. Did Alertmanager receive the alert?
11. Did routing select the expected receiver?
```

Useful commands:

```bash
curl -v http://localhost:9090/-/ready
curl -v http://localhost:9090/metrics
curl -v http://localhost:9093/-/ready
```

For Alertmanager configuration, `amtool check-config` can be used to validate the configuration without requiring a running Alertmanager server. citeturn0search0

# Practice Challenges

## Beginner

1. Add a second scrape target.
2. Change the scrape interval.
3. Write a query filtering by `job`.
4. Create a CPU panel.
5. Create a basic target-down alert.

## Intermediate

1. Create recording rules for CPU and memory.
2. Build a dashboard variable for `instance`.
3. Route critical alerts separately.
4. Create a histogram p95 query.
5. Break a target and document the troubleshooting process.

## Advanced

1. Deploy kube-prometheus-stack in a test Kubernetes cluster.
2. Monitor nodes and workloads.
3. Create Kubernetes availability alerts.
4. Build a production-style dashboard.
5. Simulate CPU, memory, disk and pod failures.
6. Write a runbook for every alert.

# Important Rule

These examples are intentionally designed for learning. Replace placeholders such as `<pod-name>`, hostnames, credentials, webhook URLs and cluster-specific values before using them in a real environment. Never commit production secrets to this repository.

The official Prometheus documentation should be used alongside these labs for version-specific configuration details. citeturn0search2turn0search9
