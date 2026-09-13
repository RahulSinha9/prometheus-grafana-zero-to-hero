# Incident Lab — Disk Full

## 🎯 Objective
Diagnose filesystem capacity exhaustion safely.

## Scenario
An application begins failing because a filesystem has insufficient free space.

## Inject
Use a disposable filesystem or container volume. Generate bounded test data until the warning threshold is reached.

## Detect
Monitor filesystem available percentage and alert before 100% usage.

## Investigate
Identify the mount point, directory growth, log files, temporary data, and inode usage.

## Recover
Remove only the test data or apply the documented cleanup. Verify filesystem availability and application recovery.

## Common causes
- Unrotated logs.
- Temporary files.
- Large artifacts.
- Unexpected application output.
- Inode exhaustion.

## Evidence
Record filesystem, usage graph, largest consumers, cleanup action, and recovered capacity.

## Safety
Never intentionally fill a production root filesystem.

## ✅ Complete when
- [ ] Alert fires.
- [ ] Largest consumer is identified.
- [ ] Disk is safely recovered.
- [ ] Prevention action is documented.