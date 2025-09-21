#!/usr/bin/env bash
set -euo pipefail


# Minimal CI gate for the demo project
pnpm install --frozen-lockfile
pnpm typecheck
pnpm lint
pnpm test


echo "✅ Basic checks passed. (Hook Cursor headless review here if available)"