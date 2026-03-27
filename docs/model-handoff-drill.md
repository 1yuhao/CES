# Model Handoff Drill (5-minute)

Purpose: verify that a new model/session can resume work without context loss.

## Drill Steps

1. Read `MEMORY.md`.
2. Read `memory/hot.md`.
3. Read one relevant warm file:
   - `memory/warm/requirements.md` for scope/behavior work
   - `memory/warm/change-log.md` for execution trace
4. Run `git log -n 20 --oneline`.
5. Answer these checks:
   - What is the current objective?
   - What are the top 3 active constraints?
   - What is the immediate next action?
   - What verification command will be run next?
   - What is the rollback path if the next change fails?

## Pass Criteria

- New model provides coherent answers to all 5 checks in under 5 minutes.
- Proposed next action is consistent with current requirements and branch policy.
