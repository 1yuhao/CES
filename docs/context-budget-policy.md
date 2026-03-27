# Context Budget Policy

This policy makes context usage measurable and enforceable.

## Default Load Set

- `MEMORY.md`
- `memory/hot.md`

## Budget Targets

- Default load set estimated tokens: <= 3000
- Single warm file estimated tokens: <= 2500
- Default + one warm file estimated tokens: <= 5000

## Estimation Method

- Estimated tokens = ceil(bytes / 4)
- This is an approximation for budget control, not exact model tokenization.

## Validation

Run:

- `scripts/context-budget-check.sh`

The check reports:

- per-file lines/bytes/estimated tokens
- aggregate estimated token totals
- pass/fail against thresholds
