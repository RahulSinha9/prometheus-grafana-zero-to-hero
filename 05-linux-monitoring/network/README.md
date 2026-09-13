# Linux Network Monitoring

## 🎯 Goal
Use network metrics to identify throughput limits, errors, drops, and interface problems.

## What to monitor
Study receive/transmit bytes, packets, errors, drops, and interface state. Compare host-level traffic with application-level traffic.

## Investigation
A network symptom may be caused by the host interface, routing, firewall, DNS, service discovery, application behavior, or an upstream dependency.

## 🧪 Lab
Generate controlled traffic between lab systems. Observe receive/transmit rates and correlate the traffic with application requests.

Then simulate a safe interface/network disruption and identify the telemetry change.

## Useful questions
- Which interface is affected?
- Is traffic increasing or failing?
- Are packets being dropped?
- Are errors increasing?
- Is only one host affected?

## Alerting
Avoid alerts based only on traffic volume. Prefer error, drop, saturation, or service-impact signals where possible.

## ✅ Completion
- [ ] Monitor traffic.
- [ ] Monitor errors/drops.
- [ ] Correlate network and application signals.
- [ ] Investigate one controlled network failure.