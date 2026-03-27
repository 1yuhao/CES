# Branch Protection Runbook (main)

This runbook defines how to enforce repository governance at the GitHub platform level.

## Target Branch

- `main`

## Required Settings

1. Require a pull request before merging.
2. Require at least 1 approving review.
3. Require review from Code Owners.
3. Dismiss stale pull request approvals when new commits are pushed.
4. Require status checks to pass before merging:
   - `governance-checks`
5. Apply rules to administrators (no admin bypass).
6. Restrict force pushes.
7. Restrict branch deletion.

## Why

- Aligns platform enforcement with repository governance rules.
- Prevents direct unreviewed changes to `main`.
- Makes policy validation (`governance-ci`) mandatory before merge.

## CLI Reference (using `gh api`)

```bash
gh api \
  --method PUT \
  repos/1yuhao/Ai-Vibe-Coding-Baseline/branches/main/protection \
  -f required_status_checks.strict=true \
  -F required_status_checks.contexts[]='governance-checks' \
  -f enforce_admins=true \
  -f required_pull_request_reviews.require_code_owner_reviews=true \
  -f required_pull_request_reviews.dismiss_stale_reviews=true \
  -f required_pull_request_reviews.required_approving_review_count=1 \
  -f restrictions=
```

If CLI authorization is unavailable, apply the same options in GitHub Settings > Branches.
