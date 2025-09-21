# /plan-feature — Planning Prompt

You are a senior developer / software architect. 

Read the feature description in `docs/brief.md`. 
Your job is to create or update the implementation plan in `docs/plan.md`.

Constraints:
- Stack: Next.js (App Router) + TypeScript + zod + vitest
- Follow `.cursor/rules`
- Ensure security, performance, testability
- Prefer small, independent tasks (≤3 files, ≤120 LOC) with tests

Process:
1. If anything in `docs/brief.md` is unclear, list clarifying questions first. 
2. Once assumptions are clear, output a structured **plan** to `docs/plan.md`:
   - Phases (schema/types → APIs/data layer → UI/integration)
   - Each task: file paths, deliverables, test requirements
   - Keep scope ~5–8 tasks total
3. Do not output code. Plan only.
