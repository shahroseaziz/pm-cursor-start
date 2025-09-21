# Code Review Checklist

> Use this checklist when opening or reviewing a PR. Keep answers short and candid. Delete sections that don’t apply.

---

## PR Meta
- **Title:** <!-- short, action-oriented -->
- **PR URL:** <!-- link to PR -->
- **Related Issue / Ticket:** <!-- e.g., JIRA-123 -->
- **Owner:** <!-- who will ship + own rollbacks -->
- **Reviewers:** <!-- @handles -->
- **Scope Summary:** <!-- what changed and why -->
- **Risk Level:** ☐ Low ☐ Medium ☐ High  
- **Release Plan:** <!-- how this goes live (flags, canary, batch, manual) -->
- **Rollback Plan:** <!-- how to revert safely -->

---

## Architecture & Data Flow
- [ ] Explain how **data flows** through the app. Note new patterns/abstractions and **why** they exist.
- [ ] Any changes that could **affect infrastructure** (build, CI/CD, hosting, queues, background jobs, third-party services)?
- [ ] Consider **empty, loading, error, and offline states**. Are they handled and tested?
- [ ] Any new **dependencies**? If heavy, could a smaller/inline alternative work? List size & purpose.
- [ ] Any **public APIs** changed? Ensure **backwards compatibility** _or_ bump API version & document.
- [ ] Are there places to add **caching** (client/server/edge) without correctness risk?
- [ ] Flags/Gates: does this change require a **feature flag**? Default off? Kill switch?

---

## Frontend (if applicable)
- [ ] **Accessibility**: keyboard navigation, focus management, ARIA roles, color contrast, reduced motion.
- [ ] **Responsive** behavior (mobile/desktop), prefers-color-scheme, zoom ≥200%.
- [ ] **Performance**: bundle impact, code-splitting, image sizes, critical CSS, avoid layout thrash.
- [ ] **i18n**: all strings localized? routes/locale params handled? number/date/currency formats?
- [ ] **State management**: predictable updates; derived vs stored state; effects idempotent.

---

## Backend / API (if applicable)
- [ ] **Input validation** & type safety at boundaries.
- [ ] **AuthN / AuthZ** changes? Update policies/roles/scopes. _Run_ `/security-review`.
- [ ] **Idempotency** for mutations, retries, and background jobs.
- [ ] **Observability**: structured logs, metrics, traces; avoid PII in logs.
- [ ] **Rate limiting** / abuse controls as needed.
- [ ] **Time/locale** correctness (TZ, DST, UTC storage).

---

## Data & Migrations
- [ ] Schema changes require a **migration**? Online/back-filled/zero-downtime steps listed.
- [ ] **Backfill/cleanup** scripts included & reversible.
- [ ] Data retention and **privacy** considerations (PII, HIPAA/PHI if applicable).

---

## Tests & Verification
- [ ] Prefer **fewer, high-quality tests**; emphasize **integration/e2e user flows**.
- [ ] Critical logic covered by unit tests with meaningful assertions.
- [ ] Added tests for **empty/loading/error/offline** paths.
- [ ] Local verification steps provided (commands, env vars, fixtures).
- [ ] Flakiness risk called out; CI runtime acceptable.

---

## Docs & DX
- [ ] Updated **README/CHANGELOG** and any runbooks/playbooks.
- [ ] Example requests/responses for APIs.
- [ ] Clear **env/config** changes (names, defaults, secrets rotation).
- [ ] Post-merge tasks (migrations, backfills, toggling flags) listed.

---

## Reviewer Notes
- **What’s most important to review?** <!-- files/areas -->
- **Non-obvious decisions & tradeoffs:** <!-- why this approach -->
- **Known follow-ups / TODOs:** <!-- keep short -->

---

## Quick Commands
```bash
# security review (update if your repo uses a different script)
pnpm run security-review

# test & typecheck
pnpm test
pnpm run typecheck

# build
pnpm build
