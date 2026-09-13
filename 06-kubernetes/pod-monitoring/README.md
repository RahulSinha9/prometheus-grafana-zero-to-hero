# Kubernetes Pod Monitoring

## 🎯 Goal
Detect unhealthy pods and trace symptoms to containers, deployments, and namespaces.

## Important states
Learn Running, Pending, Failed, Succeeded, readiness, restart counts, and container termination reasons.

## Useful signals
Track container CPU/memory, restart counters, readiness, pod phase, and workload replica state.

## 🧪 CrashLoopBackOff lab
Deploy an application with a deliberate startup failure. Detect repeated restarts, inspect:

```bash
kubectl get pods
kubectl describe pod POD_NAME
kubectl logs POD_NAME --previous
```

Then fix the configuration and verify restart counts stop increasing.

## Investigation
A pod being `Running` does not necessarily mean the application is healthy. Combine readiness, application metrics, logs, events, and resource metrics.

## ✅ Completion
- [ ] Explain pod states.
- [ ] Monitor restarts.
- [ ] Diagnose a failing container.
- [ ] Verify recovery.