# Contributing Guide

Welcome! This repo is a **Cursor-first template**.  
The goal: keep changes small, test-backed, and easy for both humans and AI agents to review.

---

## 🧭 Workflow

1. **Start with a Brief**  
   - Write or update `docs/brief.md` with the problem / feature request.

2. **Generate a Plan**  
   - Run `/plan-feature` in Cursor.  
   - Cursor will update `docs/plan.md` with a task list.  
   - Plans should reference file paths; no code in the plan.

3. **Implement Tasks in Small Diffs**  
   - Max 3 files changed, ~120 LOC per PR.  
   - Add or update tests in the same diff.  
   - Use `src/lib/**` for logic, `src/app/api/**/route.ts` for APIs, `src/app/**` for UI.

4. **Run Local Checks**  
   ```bash
   pnpm install      # install deps (once)
   pnpm test         # run tests
   pnpm run typecheck
   pnpm build        # optional sanity check
   ```
   > Do **not** run `pnpm dev` inside Cursor — only humans should start the dev server.

5. **Open a PR**  
   - Use `.github/pull_request_template.md` as your checklist.  
   - Run `/code-review` in Cursor for AI-assisted review.  
   - Keep the PR focused on a single task.

---

## 🛡 Rules Recap

- Stack: Next.js (App Router) + TypeScript + zod + vitest.  
- Env validated in `src/env.ts`. Never commit real secrets.  
- Every public function needs a unit test.  
- No vague prose — prefer code + tests.  
- Cursor agents **must not** run local servers.  
- Security review:  
  ```bash
  pnpm run security-review
  ```

---

## 🤝 How to Contribute

1. Fork or branch off `main`.  
2. Make your change (brief → plan → code → test).  
3. Commit with a clear message:  
   ```bash
   git commit -m "feat: add hello API with test"
   ```
4. Push and open a PR.  
5. Tag reviewers. Answer comments.  
6. Merge once checks pass.

---

## 📚 References

- [Cursor Docs](https://cursor.sh/docs)  
- [Next.js Docs](https://nextjs.org/docs)  
- [Vitest Docs](https://vitest.dev/)  

---

Happy building! 🚀
