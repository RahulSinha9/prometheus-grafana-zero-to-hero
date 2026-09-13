#!/usr/bin/env bash
set -euo pipefail

echo "=== CPU ==="
mpstat 1 1 || true

echo "=== Memory ==="
free -h
echo "=== Disk ==="
df -h
echo "=== Load ==="
uptime

echo "=== Top CPU processes ==="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
