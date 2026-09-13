# Incident Lab — Service Down

## 🎯 Objective
Distinguish a failed scrape from an actual service outage and investigate availability end to end.

## Scenario
A monitored service stops responding to requests.

## Detect
Start with:

```promql
up{job="api"}
```

For blackbox monitoring, use probe success and latency metrics where appropriate.

## Investigate
Check:
1. Prometheus target state.
2. DNS/service discovery.
3. Network connectivity.
4. Service endpoints.
5. Application process.
6. Dependency health.
7. Recent deployments/configuration.

## Important distinction
A target can be scrapeable while the application is unhealthy, and a scrape can fail because of monitoring infrastructure rather than the application itself. Use application health signals when available.

## Recover
Restore the service or monitoring path, then verify both scrape health and user-facing health.

## Evidence
Record alert, target status, application health, timeline, root cause, mitigation, and recovery.

## ✅ Complete when
- [ ] Detect outage.
- [ ] Separate monitoring failure from service failure.
- [ ] Identify root cause.
- [ ] Verify end-to-end recovery.