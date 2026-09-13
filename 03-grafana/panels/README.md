# Grafana Panels

## 🎯 Goal
Choose panels based on the operational question instead of the visual effect.

## Panel selection
- **Time series:** trends and incident timelines.
- **Stat:** current value or state.
- **Gauge:** bounded utilization where a threshold is meaningful.
- **Table:** detailed dimensions and top offenders.
- **Bar:** comparisons across categories.

## Panel configuration
Every useful panel should have:

- Clear title.
- Correct unit.
- Appropriate legend.
- Query description or meaningful query structure.
- Thresholds where useful.
- Sensible time range.

## 🧪 Lab
Create five panels for CPU utilization. Make one time series, one stat, one gauge, one table, and one comparison. Decide which one is most useful and explain why.

## Common mistakes
- Showing raw counters.
- Using gauges for unbounded values.
- Hiding the dimension needed to identify a failure.
- Overloading one panel with unrelated metrics.

## ✅ Completion
- [ ] Use five panel types.
- [ ] Configure units.
- [ ] Configure legends.
- [ ] Explain why each panel exists.