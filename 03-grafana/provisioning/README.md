# Grafana Provisioning

## 🎯 Goal
Manage Grafana datasources and dashboards as code so environments can be recreated consistently.

## Structure

```text
grafana/
├── provisioning/
│   ├── datasources/
│   └── dashboards/
└── dashboards/
```

## Why provisioning
Manual dashboards are difficult to reproduce and review. Provisioning puts configuration in Git and makes deployment predictable.

## Datasource provisioning
Define the Prometheus datasource in YAML and reference it from dashboards using a stable datasource identity.

## Dashboard provisioning
Configure a provider that points to exported dashboard JSON files. Keep dashboard definitions version-controlled.

## 🧪 Lab
1. Create a Prometheus datasource file.
2. Create one dashboard JSON.
3. Configure a dashboard provider.
4. Restart Grafana.
5. Verify both are loaded automatically.
6. Change the dashboard in Git and redeploy.

## Operational considerations
Separate environment-specific settings, avoid secrets in Git, and document ownership of provisioned dashboards.

## ✅ Completion
- [ ] Provision datasource.
- [ ] Provision dashboard.
- [ ] Recreate Grafana from files.
- [ ] Verify changes through Git.