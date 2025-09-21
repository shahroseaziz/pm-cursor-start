# PM Cursor Starter

A starter template for **PMs and engineers** to use [Cursor](https://cursor.sh) with Next.js, TypeScript, and guardrails.  
This repo helps non-technical teammates **prototype, plan, and code with AI** safely.

---

## 🚀 What’s Inside

- **Next.js (App Router)** + **TypeScript**  
- **pnpm** package manager  
- **zod** for runtime + env validation (`src/env.ts`)  
- **vitest** for testing  
- **eslint + prettier** for lint/format  
- **Docs-first workflow**: `docs/brief.md`, `docs/plan.md`  
- **AI commands** in `docs/commands/`:
  - `/plan-feature` → generate plan from `brief.md`
  - `/code-review` → run structured PR review
  - `/reconcile-plan` → tidy plan/brief (mark done, prune, append history)
  - `/audit-repo` → external “consultant” repo sweep

---

## 🧭 Workflow for PMs & Engineers (step-by-step)

### Day 0 — Set up once
1. **Clone this repo**
   ```bash
   git clone https://github.com/<your-org>/<repo>.git
   cd <repo>
   ```
2. **Install tools (one-time)**
   - Node 20+: https://nodejs.org  
   - pnpm: `corepack enable && corepack prepare pnpm@latest --activate` (or `brew install pnpm`)
3. **Install dependencies**
   ```bash
   pnpm install
   ```
4. **(Engineers only) Sanity check**
   ```bash
   pnpm dev       # open http://localhost:3000, look for homepage
   pnpm test      # should pass
   pnpm typecheck # should pass
   ```

---

### Phase 1 — Write the Brief (PM-led)
**Goal:** Capture *why/what* in plain English.

1. Open `docs/brief.md`.
2. Fill out:
   - **Problem** (1–2 short paragraphs)
   - **Goals** (numbered, testable)
   - **Guardrails/Constraints** (security, privacy, performance)
   - **Success Metrics**
3. If you add new ideas later, **append** a dated note under `## History`, e.g.  
   `### 2025-09-20 — Add user dashboard v1`

> Tip: Keep it under ~2 screens. Cursor is best at refining, not guessing intent.

---

### Phase 2 — Generate the Plan (in Cursor)
**Goal:** Turn the brief into a short, buildable task list.

1. Open the repo in **Cursor**.
2. In the chat, run the command **`/plan-feature`** (we provided this in `docs/commands/plan-feature.md`).
   - The agent **reads `docs/brief.md`**.
   - It **writes or updates `docs/plan.md`**.
3. Review `docs/plan.md`. A good plan has:
   - **5–8 tasks**, grouped by phase
   - Each task has **file paths** and **tests** (e.g., `files: src/lib/x.ts — tests: tests/x.spec.ts`)
   - Small scope (≤3 files, ≤~120 LOC per task)
4. If the plan is too big, ask the agent:
   > “Shrink Phase 1 to 2–3 tasks that we can finish today.”

> Important: The plan is **Markdown only** (no code). It’s your mini-backlog.

---

### Phase 3 — Build in Small Diffs (engineer or Cursor-assisted)
**Goal:** Implement one task cleanly, with tests, then PR.

1. **Create a branch**
   ```bash
   git checkout -b feat/<short-task-name>
   ```
2. **Implement only the first task** in `docs/plan.md`.
   - Keep changes **focused** (≤3 files).
   - Add/update **tests** in the same diff.
3. **Local checks**
   ```bash
   pnpm test
   pnpm typecheck
   pnpm build   # optional
   ```
   > Agents **must not** run `pnpm dev`. Humans only. If needed, start it yourself to manually verify.
4. **Commit clearly**
   ```bash
   git add -A
   git commit -m "feat: <task> (files + tests)"
   git push -u origin HEAD
   ```

---

### Phase 4 — Review & Merge
**Goal:** Keep quality high without ceremony.

1. **Open a PR** on GitHub (or `gh pr create`).
2. Fill the **PR template** (it’s short; make it count).
3. In Cursor, run **`/code-review`** (agent reads diff + template and outputs issues/fixes).
4. Address comments (human + agent), keep the PR small.
5. Merge when:
   - Tests and typecheck pass
   - Reviewers approve
   - Checklist looks good

---

### Phase 5 — Keep Docs Tidy (light maintenance)
**Goal:** Prevent `brief.md`/`plan.md` from going stale.

- After merges, update `docs/plan.md`: check off done tasks or move them to a **`## Done`** section.
- If requirements change, update `docs/brief.md` and **date-stamp** new asks under `## History`.

**Helpers:**
- **Reconcile automatically (safe & conservative):**
  ```bash
  bash scripts/docs/reconcile.sh
  git diff   # review, then commit if correct
  ```
  *This agent will mark tasks done only if there’s evidence (files/tests exist), move them to `## Done`, and keep open tasks lean.*

- **Audit periodically (outside perspective):**
  ```bash
  bash scripts/ci/audit.sh
  ```
  *This “consultant agent” checks that the repo matches the README/rules, scripts exist, guardrails are present, and onboarding is smooth. CI runs it weekly & on PRs.*

---

## FAQ — Common “Wait, how do I…?” moments

**Q: Where do I add a new feature next week?**  
A: Append it to `docs/brief.md` under `## History` with today’s date. Then re-run `/plan-feature`. The agent will fold it into `docs/plan.md`.

**Q: Do agents update the brief/plan automatically when tasks are done?**  
A: No. You (or `reconcile.sh`) keep them up to date. Treat docs like code: small, intentional edits.

**Q: When should I run the dev server?**  
A: Only for manual verification. **Agents must not** run it. You can start it with `pnpm dev` locally.

**Q: The plan wants to touch >3 files.**  
A: Ask the agent to split it:  
> “Split this into 2 smaller tasks with separate PRs. ≤3 files each.”

**Q: The agent wants to change CI or secrets.**  
A: That’s against the rules—decline. Open a separate, explicit task if needed.

**Q: I’m non-technical. Can I still drive this?**  
A: Yes. You own `docs/brief.md` and `/plan-feature`, where the majority of your work is being defined and run from!

---

## Verification Checklist (copy into each PR)
- [ ] Task maps to `docs/plan.md`
- [ ] ≤3 files touched, tests included
- [ ] `pnpm test` and `pnpm typecheck` pass
- [ ] PR template filled, `/code-review` run
- [ ] `docs/plan.md` updated (checked items moved to `## Done`)

---

## 📚 References

- [Cursor Docs](https://cursor.sh/docs)  
- [Next.js Docs](https://nextjs.org/docs)  
- [Vitest Docs](https://vitest.dev/)  
- [pnpm Docs](https://pnpm.io)

---

Happy building! 🚀
