# kube-state-metrics

## 🎯 Goal
Understand how Kubernetes API object state becomes Prometheus metrics.

## What it provides
kube-state-metrics exposes information about Kubernetes objects such as deployments, pods, jobs, replicas, and namespaces. It is primarily about object state, not raw node CPU consumption.

## Important distinction
- kube-state-metrics: desired/current Kubernetes object state.
- Node Exporter: operating-system metrics.
- kubelet/cAdvisor: container and node runtime resource metrics.

## 🧪 Lab
Deploy kube-state-metrics and inspect metrics for deployments and pods. Find a metric representing desired replicas and another representing available replicas.

## Investigation exercise
Create a deployment replica mismatch and use state metrics to identify the condition. Then inspect pods and events to find the reason.

## Cardinality
Kubernetes metadata can create many labels and series. Learn which dimensions are required before adding them to dashboards.

## ✅ Completion
- [ ] Explain its role.
- [ ] Query object-state metrics.
- [ ] Distinguish it from Node Exporter.
- [ ] Diagnose a replica mismatch.