# Context Mode Policy

This policy separates AI engineering governance from code implementation context.

## Modes

## Base Mode (default)

Use for:

- requirements updates
- governance updates
- risk/project management
- review and planning

Load set:

- `MEMORY.md`
- `memory/hot.md`
- one warm file on demand

Do not load broad source-code context in this mode.

## Code Mode (on-demand)

Use only when:

- implementing features/fixes
- debugging
- writing/refactoring tests

Load rule:

- load only the minimum code scope required for current task
- avoid full-repo code loading unless explicitly needed

## Exit Rule

After implementation + verification, return to Base Mode for memory and governance updates.
