# Incident Lab — Memory Leak

## 🎯 Objective
Recognize gradual memory growth and distinguish it from normal cache or workload behavior.

## Scenario
An application consumes progressively more memory and eventually approaches its limit.

## Inject
Use a disposable application that intentionally allocates memory over time.

## Detect
Graph available memory and application/container memory. Alert on sustained pressure rather than a single sample.

## Investigate
Compare memory growth with request traffic, deployment changes, restarts, and application behavior. Determine whether the growth is host, container, or process specific.

## Recover
Restart or remove the lab workload, then verify memory returns toward baseline. Document the temporary mitigation separately from the permanent fix.

## Evidence
Capture a time range showing growth, alert firing, affected workload, and recovery.

## Challenge
Explain why a sudden memory spike and a slow memory leak require different investigation strategies.

## ✅ Complete when
- [ ] Detect growth.
- [ ] Identify affected workload.
- [ ] Demonstrate recovery.
- [ ] Document root cause hypothesis and evidence.