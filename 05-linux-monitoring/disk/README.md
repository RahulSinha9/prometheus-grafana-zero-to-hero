# Linux Disk Monitoring

## 🎯 Goal
Monitor filesystem capacity and I/O so you can distinguish a full disk from a slow disk.

## Capacity
Use filesystem metrics to calculate available percentage and alert before a filesystem becomes unusable.

## I/O
Study read/write operations, throughput, and latency-related metrics. High utilization can cause application latency even when plenty of capacity remains.

## 🧪 Lab — Disk full
On a disposable filesystem, create bounded test data until a safe alert threshold is reached. Identify the mount point and largest consumers, then remove only the test data.

## Investigation checklist
- Which filesystem?
- Capacity or I/O problem?
- Which directory consumes space?
- Are inodes exhausted?
- Did logs or temporary files grow?
- Is the workload generating abnormal I/O?

## Alerting
Alert before the filesystem reaches 100%. Use different thresholds for warning and critical conditions.

## Safety
Never fill the root filesystem or production disk as a learning exercise.

## ✅ Completion
- [ ] Monitor capacity.
- [ ] Monitor I/O.
- [ ] Understand inode pressure.
- [ ] Complete a safe disk-full lab.