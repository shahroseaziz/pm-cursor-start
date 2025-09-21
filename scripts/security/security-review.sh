#!/usr/bin/env bash
# scripts/security/security-review.sh
# Basic security checks for the repository (fast + demo-friendly)

set -euo pipefail

say() { printf "\n%s\n" "$1"; }
warn() { printf "\n⚠️  %s\n" "$1"; }

say "🔐 Running security review..."

# 0) Pre-flight
if ! command -v grep >/dev/null 2>&1; then
  warn "grep not found; skipping scans"
  exit 0
fi

# 1) Obvious secrets (rough heuristic; ignore env reads)
say "🔎 Checking for hardcoded secrets in src/"
if grep -RIn -E '(password|secret|api[_-]?key|token|BEGIN [A-Z ]+ PRIVATE KEY)' \
  src/ --exclude-dir=node_modules --exclude='*.test.*' --exclude='*.spec.*' \
  | grep -vE '^\s*(//|\*)' \
  | grep -v 'process\.env' || true; then
  warn "Potential hardcoded secrets found (review output above)."
else
  say "✅ No obvious hardcoded secrets"
fi

# 2) .env example present?
say "🗂 Verifying .env.example exists"
if [ -f ".env.example" ]; then
  say "✅ .env.example present"
else
  warn "❌ .env.example missing"
fi

# 3) Optional dependency audit (best-effort)
if command -v pnpm >/dev/null 2>&1; then
  say "📦 pnpm audit (prod only)"
  pnpm audit --prod || warn "Audit reported issues (review above)"
else
  warn "pnpm not found; skipping dependency audit"
fi

say "✅ Security review complete"
