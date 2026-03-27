# Memory Architecture

## Layering

- `MEMORY.md`: short control plane and index.
- `memory/hot.md`: current operational state.
- `memory/warm/*`: reusable project knowledge.
- `memory/cold/*`: immutable historical logs.

## Load Policy

- Default load: `MEMORY.md` + `memory/hot.md`.
- Load `warm` only when required by task type.
- Load `cold` only for explicit historical tracing.

## Write Policy

For every meaningful task:

1. append a concise factual entry to the active monthly cold log
2. update `memory/hot.md` current state when relevant
3. append commit mapping in `memory/warm/change-log.md`
4. add or update decision/risk entries if behavior changes
