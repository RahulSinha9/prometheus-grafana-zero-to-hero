# 03 — Grafana

Learn how to turn Prometheus data into useful dashboards that help engineers understand system health and troubleshoot incidents.

## 🎯 Module Goal

By the end of this module, you should be able to connect Grafana to Prometheus, build dashboards, create reusable variables, choose useful panels, and provision dashboards as code.

## 📚 Learning Path

### Prometheus Datasource

Configure Prometheus as a Grafana data source and understand:

- Prometheus URL
- Access mode
- Query execution
- Connectivity testing
- Datasource reuse across dashboards

### Dashboards

Learn how to design dashboards around operational questions rather than simply displaying every available metric.

A useful service dashboard can include:

- Request rate
- Error rate
- Latency
- Saturation
- CPU and memory
- Instance health

### Variables

Use dashboard variables for reusable views.

Example variable ideas:

```text
$environment
$cluster
$namespace
$service
$instance
```

Practice filtering PromQL queries with variables so one dashboard can support multiple environments or services.

### Panels

Learn when to use:

- Time series
- Stat
- Gauge
- Bar chart
- Table
- Heatmap
- Logs / annotations where appropriate

Focus on choosing a visualization that answers a specific question.

### Provisioning

Move from manually configured dashboards to repeatable configuration stored in Git.

Learn the concepts of:

- Datasource provisioning
- Dashboard provisioning
- JSON dashboard definitions
- Folder organization
- Version-controlled Grafana configuration

## 🧪 Hands-On Labs

- Connect Grafana to the Prometheus lab.
- Build a Linux host dashboard.
- Build a service RED dashboard: Rate, Errors, Duration.
- Add environment and instance variables.
- Add threshold-based panels.
- Create a dashboard from a clean Grafana instance using provisioning.

## 🧭 Dashboard Design Rules

Prefer dashboards that make these questions easy to answer:

1. Is the service healthy?
2. Are requests increasing or decreasing?
3. Are errors increasing?
4. Is latency degrading?
5. Which instance or workload is responsible?
6. When did the problem start?

Avoid dashboards that contain dozens of unrelated panels without a clear operational purpose.

## 🔍 Troubleshooting

```text
No data in Grafana
      │
      ├── Test Prometheus datasource
      ├── Run the PromQL query in Prometheus
      ├── Check time range
      ├── Check dashboard variables
      ├── Inspect panel query
      └── Verify metric labels
```

## ✅ Completion Checklist

- [ ] Configure Prometheus datasource.
- [ ] Create a useful dashboard.
- [ ] Build time-series and stat panels.
- [ ] Use dashboard variables.
- [ ] Apply thresholds appropriately.
- [ ] Understand dashboard JSON.
- [ ] Provision a datasource.
- [ ] Provision a dashboard from Git.

## 🚀 Next Step

Continue to [`04-alerting`](../04-alerting/) and learn how to turn important metric conditions into actionable alerts.