# PM Cursor Starter Template

This repo is a **starter kit for new projects** built with [Cursor](https://cursor.sh).  
It gives Product Managers and Engineers a shared workflow: write briefs, generate plans, build in small diffs, and review with AI guardrails.

---

## 🗂 What’s Inside

```
.
├── .cursor/                 # Cursor rules to keep AI outputs safe + consistent
│   └── rules.md
├── .github/
│   └── pull_request_template.md   # Built-in PR checklist
├── docs/
│   ├── brief.md             # Feature brief (PM/you fill this in)
│   ├── plan.md              # Implementation plan (Cursor updates this)
│   └── commands/            # Ready-to-use Cursor prompts
│       ├── plan-feature.md
│       ├── code-review.md
│       └── code-review-agent.md
├── scripts/
│   └── ci/agent-review.sh   # Minimal CI helper
├── src/
│   ├── app/
│   │   ├── layout.tsx
│   │   ├── page.tsx
│   │   └── api/
│   │       └── hello/
│   │           └── route.ts
│   └── lib/
│       └── hello.ts         # tiny function used in test
├── tests/
│   └── hello.spec.ts        # simple unit tests
├── package.json
├── tsconfig.json
├── vitest.config.ts
├── next.config.js
├── .env.example
└── .gitignore
```

---

## 🚀 Quickstart (as a new project)

1. **Create a repo from this template**
   ```bash
   gh repo create my-new-project      --template shahroseaziz/pm-cursor-start      --private
   cd my-new-project
   ```

2. **Install & run**
   ```bash
   pnpm install
   pnpm dev
   ```
   Open [http://localhost:3000](http://localhost:3000) in your browser; try the API at `/api/hello`.

3. **Run tests & type‑checking**
   ```bash
   pnpm test
   pnpm run typecheck
   ```

---

## 🧭 Workflow

1. **Brief**  
   PM writes the high‑level feature description in `docs/brief.md`.

2. **Plan**  
   Run `/plan-feature` in Cursor. The agent will:
   - Read `docs/brief.md`
   - Ask clarifying questions if needed
   - Write a structured plan into `docs/plan.md`

3. **Build**  
   Developers (or Cursor‑assisted) implement tasks in **small diffs**:
   - At most 3 files per task
   - Keep tasks under ~120 lines changed
   - Tests for new functionality

4. **Review**  
   Use:
   - `.github/pull_request_template.md` for the human checklist  
   - `docs/commands/code-review-agent.md` for AI‑assisted review  

5. **Ship**  
   Merge after review, run `pnpm run security-review`, then deploy.

---

## 🛡 Guardrails

- `.cursor/rules.md` enforces consistency: stack, tests, diff size, no secrets, etc.  
- PR checklist ensures architecture, DX, security, observability are baked in.  
- `scripts/security/security-review.sh` (optional but recommended) for CI safety checks.

---

## 📝 Notes

- Keep `brief.md` clear and concise—Cursor models follow whatever ambiguity is given.  
- If scope or requirements change, update `docs/plan.md` accordingly.  
- Small diffs make reviews (human & AI) far more reliable.  
- The template is opinionated toward Next.js + TypeScript + zod + vitest—but you can adapt the stack later if you want.

---

## 🤝 Contributing

- Improve any prompt in `docs/commands/`.  
- Revise `rules.md` if you find better constraints.  
- Share improvements across team so everyone benefits.

---

## 📜 License

MIT © [shahroseaziz](https://github.com/shahroseaziz)
