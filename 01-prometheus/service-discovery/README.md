# Service Discovery

## 🎯 Goal
Move beyond hard-coded targets and understand how Prometheus finds changing infrastructure.

## Why discovery matters
Dynamic environments create and destroy instances, pods, and services. Static target lists quickly become stale.

## Discovery concepts
Study file-based, DNS, EC2, Kubernetes, and other supported discovery mechanisms. Each produces target metadata that can be transformed with relabeling.

## Relabeling
Learn the difference between target relabeling and metric relabeling. Practice selecting, dropping, renaming, and constructing labels without accidentally removing all targets.

## Kubernetes example concepts
Understand how Prometheus can discover pods, services, endpoints, and nodes, then use labels such as namespace and application identity.

## 🧪 Lab
1. Start with static targets.
2. Replace them with file-based discovery.
3. Change the discovery file.
4. Observe target changes.
5. Add relabeling to keep only desired targets.

## 🔍 Troubleshooting
Discovery missing → inspect discovered metadata → inspect relabel rules → check final target list → test endpoint.

## ✅ Completion
- [ ] Explain static vs dynamic discovery.
- [ ] Use file-based discovery.
- [ ] Explain relabeling.
- [ ] Troubleshoot a missing discovered target.