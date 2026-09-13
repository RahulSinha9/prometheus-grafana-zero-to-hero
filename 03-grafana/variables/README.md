# Grafana Variables

## 🎯 Goal
Create dashboards that work across clusters, namespaces, jobs, and instances without duplicating dashboards.

## Variable examples

```text
$cluster
$namespace
$job
$instance
```

Variables can be populated from Prometheus label values or query results.

## Query usage

```promql
rate(http_requests_total{job=~"$job"}[5m])
```

Use regex matching when a variable allows multiple selections.

## Design considerations
- Provide a useful default.
- Avoid extremely high-cardinality variable lists.
- Keep variable names understandable.
- Order variables from broad scope to narrow scope.

## 🧪 Lab
Create cluster → namespace → workload variables. Use them to filter multiple panels consistently.

## Troubleshooting
Empty variable → inspect datasource → inspect label name → inspect returned values → test query without variable → check escaping/multi-select behavior.

## ✅ Completion
- [ ] Create a variable.
- [ ] Use it in PromQL.
- [ ] Enable multi-select.
- [ ] Create dependent filters.
- [ ] Test with two environments.