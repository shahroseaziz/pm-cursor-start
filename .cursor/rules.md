# Cursor Repository Rules (v1)
# Purpose: keep agent output safe, small, typed, and test‑backed. Agents = helpers, not freehand coders.

## Tech stack (enforce)
- Framework: Next.js (App Router), TypeScript.
- Package manager: pnpm.
- Validation: zod. Env validation via src/env.ts (zod‑based).
- Tests: vitest (unit) + Testing Library (optional for UI).
- Lint/format: eslint + prettier. Follow existing configs; if absent, generate minimal ones.

## Golden workflow
1) Start from a brief in `docs/brief.md`.
2) Create/refresh a plan in `docs/plan.md` (no code; file‑linked task list).
3) Implement in **small diffs** (≤ 3 files, ≤ ~120 lines changed) per task.
4) For any new code, **also add tests** in the same diff.
5) Run `/code-review` checklist before asking for more features.

## Output & prompting constraints
- **Never** produce vague prose solutions. Prefer **code + tests**.
- If generating model interactions, **emit JSON only** that conforms to exported zod schemas.
- Prefer function‑calling / tool schemas. Temperature 0–0.3 for structured steps.
- Cite file paths explicitly in plans and reviews.

## File boundaries
- Do not modify CI, deployment, or secrets config unless the task explicitly says so.
- Never write credentials. Create `.env.example` and `src/env.ts`; read real values only from process.env at runtime.
- Place new server code under `src/app/api/**/route.ts` or `src/lib/**`. UI under `src/app/**`.

## Security & privacy
- No network calls except: OpenAI/Anthropic provider selected for the demo.
- Strip PII in logs. Don’t print secrets or full responses. Cap input length.
- For generated SQL, enforce **SELECT‑only** and table/column allow‑lists.

## Dependencies
- Add deps only if necessary. Pin to caret stable (e.g., ^x.y.z). Prefer stdlib first.
- Do not add global scaffolds or unvetted CLIs.

## Testing policy
- Each public function must have at least one unit test.
- Add adversarial tests for the guardrails (e.g., SQL injection, over‑long inputs).
- `pnpm test` must pass before concluding a task.

## Diff discipline
- Keep changes minimal and self‑contained. Explain each change at the top of the PR/commit body.
- If scope drifts, open a **new plan task** rather than inflating the diff.

## Review checklist
- Types tight (no `any`), zod validations present, errors handled.
- No dead code / unused imports; lints pass.
- No secrets, no CI edits, no broad file churn.
- Tests present and meaningful; negative cases included.

# End of rules