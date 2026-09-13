# Incident Lab — Pod CrashLoopBackOff

## 🎯 Objective
Practice Kubernetes troubleshooting from an alert to the failing container.

## Scenario
A deployment repeatedly restarts because its container cannot start successfully.

## Inject
Deploy a lab workload with an intentional configuration or startup failure.

## Detect
Use restart metrics, pod status, and alerts.

## Investigate

```bash
kubectl get pods
kubectl describe pod POD_NAME
kubectl logs POD_NAME
kubectl logs POD_NAME --previous
kubectl get events --sort-by=.lastTimestamp
```

Determine whether the cause is configuration, image, permissions, probes, dependencies, or resource limits.

## Recover
Fix the workload definition and redeploy. Confirm readiness and that restart counts stop increasing.

## Prometheus investigation
Correlate restart count and pod state with deployment replica state, resource metrics, and application metrics.

## Evidence
Record namespace, workload, pod, container, error message, timeline, fix, and stable recovery.

## ✅ Complete when
- [ ] Alert identifies the workload.
- [ ] Container cause is proven.
- [ ] Fix is applied.
- [ ] Stable state is verified.