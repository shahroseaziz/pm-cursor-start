#!/usr/bin/env bash
# scripts/ci/audit.sh
# Run fast, repeatable checks + a headless Cursor audit. Does not auto-commit.

set -euo pipefail

say() { printf "\n%s\n" "$1"; }
warn() { printf "\n⚠️  %s\n" "$1"; }

say "🔎 Repo audit starting..."

# 0) Pre-flight
if ! command -v node >/dev/null 2>&1; then warn "Node not found"; fi
if ! command -v pnpm >/dev/null 2>&1; then warn "pnpm not found"; fi

# 1) Typecheck & tests (skip gracefully if scripts missing)
if grep -q '"typecheck"' package.json 2>/dev/null; then
  say "🧪 Typecheck"; pnpm run -s typecheck || warn "Typecheck failed"
fi
if grep -q '"test"' package.json 2>/dev/null; then
  say "🧪 Tests"; pnpm test || warn "Tests failed"
fi

# 2) Security quick pass (optional script)
if grep -q '"security-review"' package.json 2>/dev/null; then
  say "🔐 Security review"; pnpm run -s security-review || warn "Security review reported issues"
fi

# 3) Cursor audit (headless)
if command -v cursor >/dev/null 2>&1; then
  say "🤖 Cursor audit (docs/commands/audit-repo.md)"
  cursor run docs/commands/audit-repo.md || warn "Cursor audit failed"
else
  warn "cursor CLI not found; skipping agent audit"
fi

say "✅ Audit finished. Review output and any diffs, then commit as needed."
