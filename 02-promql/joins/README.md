# PromQL Vector Matching & Joins

## 🎯 Goal
Combine related metrics safely when the information required for an investigation is split across series.

## Why joins are needed
One metric may contain resource usage while another contains metadata. Vector matching can combine them when labels identify the same entity.

## Matching

```promql
metric_a * on(instance) metric_b
```

Learn `on()` to define matching labels and `ignoring()` to exclude labels from matching.

## Group modifiers

`group_left` and `group_right` handle one-to-many and many-to-one relationships. Use them carefully because they can multiply output series.

```promql
metric_a * on(instance) group_left(label)
metric_b
```

## 🧪 Lab
Join a resource metric with a metadata metric using `instance`. First inspect both vectors independently, then add matching. Verify the number of output series.

## Safety rules
- Confirm matching labels exist on both sides.
- Understand cardinality before using group modifiers.
- Avoid joins that accidentally create huge result sets.
- Test the query with a narrow label selection first.

## ✅ Completion
- [ ] Explain vector matching.
- [ ] Use `on()`.
- [ ] Use `ignoring()`.
- [ ] Explain `group_left`.
- [ ] Validate output cardinality.