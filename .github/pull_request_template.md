<!-- Keep it short and candid. Delete sections that don’t apply. This template helps reviewers focus on what matters. -->

## PR Meta
- **Title:**
- **Related Issue / Ticket:**
- **Owner:**
- **Reviewers:**
- **Scope Summary:** <!-- what + why in 1–2 sentences -->
- **Risk Level:** [ ] Low  [ ] Medium  [ ] High
- **Release Plan:** <!-- flags, canary, batch, manual -->
- **Rollback Plan:** <!-- how to revert safely -->

## Architecture & Data Flow
- [ ] Data flow explained; new patterns justified.
- [ ] Infra/CI/third-party changes noted.
- [ ] Empty / loading / error / offline states handled.
- [ ] New dependencies listed with purpose/size (prefer smaller alternatives).
- [ ] Public API changes documented or versioned.
- [ ] Caching opportunities considered (client/server/edge).
- [ ] Flags/gates plan included (default off? kill switch?).

## Frontend (if applicable)
- [ ] Accessibility (keyboard, focus, ARIA, contrast, reduced motion).
- [ ] Responsive behavior (mobile/desktop), prefers-color-scheme, zoom ≥200%.
- [ ] Performance (bundle impact, code-splitting, image sizes, critical CSS).
- [ ] i18n (localized strings, number/date/currency).
- [ ] State management (derived vs stored; effects idempotent).

## Backend / API (if applicable)
- [ ] Input validation & type safety at boundaries.
- [ ] AuthN/AuthZ changes noted; policies/roles/scopes updated.
- [ ] Idempotency for mutations; retries/backoff where needed.
- [ ] Observability (structured logs, metrics, traces); avoid PII in logs.
- [ ] Rate limiting / abuse controls as needed.
- [ ] Time/locale correctness (UTC storage, TZ/DST handling).

## Data & Migrations
- [ ] Migration plan (online/zero-downtime) and backfill/cleanup scripts.
- [ ] Data retention & privacy considerations (PII, HIPAA/PHI if applicable).

## Tests & Verification
- [ ] Integration/e2e flows emphasized; critical logic unit-tested.
- [ ] Empty/loading/error/offline paths tested.
- [ ] Local verification steps provided (commands, env vars, fixtures).
- [ ] Flakiness risks noted; CI runtime acceptable.

## Docs & DX
- [ ] README/CHANGELOG/runbooks updated.
- [ ] Example API requests/responses included.
- [ ] Env/config changes documented (names, defaults, secret rotation).
- [ ] Post-merge tasks listed (migrations, backfills, toggling flags).

## Reviewer Notes
- **Focus areas:**
- **Tradeoffs & decisions:**
- **Follow-ups / TODOs:**
