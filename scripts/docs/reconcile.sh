#!/usr/bin/env bash
# scripts/docs/reconcile.sh
#
# Run the /reconcile-plan agent headlessly against this repo.
# Compatible with Cursor CLI versions that don't support `--repo`.
# Will not auto-commit changes.

set -euo pipefail

echo "🤖 Reconciling docs/plan.md and docs/brief.md with Cursor agent..."

# Ensure cursor CLI is installed
if ! command -v cursor >/dev/null 2>&1; then
  echo "❌ cursor CLI not found. Install from https://cursor.sh before running."
  exit 1
fi

# Run from repo root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$REPO_ROOT"

# Run the reconcile agent (no --repo flag)
cursor run docs/commands/reconcile-plan.md || {
  echo "⚠️  'cursor run' failed. Ensure the agent file exists at docs/commands/reconcile-plan.md"
  exit 1
}

echo "✅ Done. Review changes with 'git diff' and commit if correct."
