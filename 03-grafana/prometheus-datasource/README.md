# Grafana Prometheus Datasource

## 🎯 Goal
Connect Grafana to Prometheus and understand how datasource configuration affects every dashboard query.

## Configure
Provide the Prometheus server URL reachable from Grafana. In Docker Compose, remember that `localhost` inside the Grafana container refers to Grafana itself, not the Prometheus container.

## Validate
Use the datasource test, then run a simple query:

```promql
up
```

A successful connection does not prove that the desired target data exists; validate actual series too.

## Common connection failures
- Wrong URL.
- Wrong container hostname.
- Port not exposed/reachable.
- Network mismatch.
- TLS configuration problems.
- Authentication/proxy problems.

## 🧪 Lab
Connect Grafana to the repository's local Prometheus lab. Build one panel from `up`, then one from Node Exporter.

## Operational practice
Document the datasource URL, authentication method, environment, and ownership. Avoid embedding secrets in dashboard JSON.

## ✅ Completion
- [ ] Add datasource.
- [ ] Test connection.
- [ ] Query `up`.
- [ ] Build a panel.
- [ ] Troubleshoot one intentionally wrong URL.