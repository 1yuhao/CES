#!/usr/bin/env bash

set -euo pipefail

repo="1yuhao/Ai-Vibe-Coding-Baseline"
branch="main"

echo "[branch-protection-check] checking $repo:$branch ..."
json="$(gh api "repos/$repo/branches/$branch/protection")"

echo "$json" | jq '{required_pull_request_reviews: .required_pull_request_reviews.required_approving_review_count, require_code_owner_reviews: .required_pull_request_reviews.require_code_owner_reviews, strict_status_checks: .required_status_checks.strict, contexts: .required_status_checks.contexts, enforce_admins: .enforce_admins.enabled, allow_force_pushes: .allow_force_pushes.enabled, allow_deletions: .allow_deletions.enabled}'

require_reviews="$(echo "$json" | jq -r '.required_pull_request_reviews.required_approving_review_count')"
require_codeowners="$(echo "$json" | jq -r '.required_pull_request_reviews.require_code_owner_reviews')"
strict_checks="$(echo "$json" | jq -r '.required_status_checks.strict')"
enforce_admins="$(echo "$json" | jq -r '.enforce_admins.enabled')"
allow_force_pushes="$(echo "$json" | jq -r '.allow_force_pushes.enabled')"
allow_deletions="$(echo "$json" | jq -r '.allow_deletions.enabled')"
has_governance_check="$(echo "$json" | jq -r '.required_status_checks.contexts | index("governance-checks") != null')"

if [[ "$require_reviews" -lt 1 ]]; then
  echo "Branch protection violation: at least 1 approving review is required." >&2
  exit 1
fi

if [[ "$require_codeowners" != "true" ]]; then
  echo "Branch protection violation: code owner reviews must be required." >&2
  exit 1
fi

if [[ "$strict_checks" != "true" ]]; then
  echo "Branch protection violation: strict status checks must be enabled." >&2
  exit 1
fi

if [[ "$enforce_admins" != "true" ]]; then
  echo "Branch protection violation: admin bypass must be disabled (enforce_admins=true)." >&2
  exit 1
fi

if [[ "$allow_force_pushes" != "false" ]]; then
  echo "Branch protection violation: force pushes must be disabled." >&2
  exit 1
fi

if [[ "$allow_deletions" != "false" ]]; then
  echo "Branch protection violation: branch deletions must be disabled." >&2
  exit 1
fi

if [[ "$has_governance_check" != "true" ]]; then
  echo "Branch protection violation: governance-checks status check is missing." >&2
  exit 1
fi

echo "[branch-protection-check] done."
