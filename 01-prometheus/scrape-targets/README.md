# Scrape Targets

## 🎯 Goal
Learn exactly how Prometheus discovers and scrapes a target and how to determine why a target is `DOWN`.

## Target lifecycle

```text
Discovery → Target labels → HTTP scrape → Parse metrics → Store samples
```

A target normally exposes a metrics endpoint such as `/metrics`. Prometheus records scrape health with the `up` metric.

## Useful queries

```promql
up
up{job="node"}
scrape_samples_scraped
scrape_duration_seconds
```

Use the target page for endpoint, labels, last scrape, scrape duration, and error details.

## Failure scenarios
- Wrong hostname.
- Wrong port.
- Wrong path.
- DNS failure.
- Firewall/network policy.
- Exporter stopped.
- Invalid metrics response.
- TLS/authentication problems.

## 🧪 Lab
Create one healthy target and one deliberately broken target. Compare target-page errors and PromQL results.

## Investigation exercise
When `up == 0`, prove whether the issue is discovery, connectivity, endpoint availability, or metric parsing before changing configuration.

## ✅ Completion
- [ ] Explain `up`.
- [ ] Inspect target metadata.
- [ ] Diagnose five failure types.
- [ ] Recover a failed scrape.