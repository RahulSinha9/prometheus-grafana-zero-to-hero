# Prometheus Configuration

## 🎯 Goal
Understand `prometheus.yml` well enough to add targets, control scrape behavior, and troubleshoot configuration errors.

## Important sections

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: node
    static_configs:
      - targets: ["node-exporter:9100"]
```

Study `global`, `scrape_configs`, `rule_files`, `alerting`, and remote-write related configuration.

## Scrape settings
Understand scrape interval, timeout, path, scheme, parameters, and target labels. A shorter interval increases collection frequency and resource usage.

## Labels
Learn how `job` and `instance` are assigned and how static labels can provide environment or ownership context.

## Reloading
Practice changing configuration and applying it safely. Understand when a restart is required and how to validate configuration before deployment.

## 🧪 Lab
1. Add an exporter.
2. Give it a meaningful `job_name`.
3. Add environment labels.
4. Verify the target.
5. Break the YAML indentation.
6. Read the error and fix it.

## Troubleshooting
Check syntax → process logs → target discovery → target endpoint → labels → query.

## ✅ Completion
- [ ] Explain every major section.
- [ ] Add a scrape job.
- [ ] Add labels.
- [ ] Change an interval intentionally.
- [ ] Diagnose a malformed config.