import { z } from "zod";

/**
 * Centralized runtime env validation.
 * - Keep secrets out of the repo; commit only .env.example
 * - Access via env.SOME_VAR, not process.env directly
 */
const schema = z.object({
  NODE_ENV: z.enum(["development", "test", "production"]).default("development"),
  // Example: add real keys as needed, e.g.:
  // OPENAI_API_KEY: z.string().min(1, "Missing OPENAI_API_KEY")
});

const parsed = schema.safeParse({
  NODE_ENV: process.env.NODE_ENV,
  // OPENAI_API_KEY: process.env.OPENAI_API_KEY,
});

if (!parsed.success) {
  // Fail fast in dev/test; log a concise error in prod
  const message = parsed.error.errors.map(e => `${e.path.join(".")}: ${e.message}`).join("; ");
  if (process.env.NODE_ENV !== "production") {
    throw new Error(`Invalid env: ${message}`);
  } else {
    // eslint-disable-next-line no-console
    console.warn(`Invalid env (continuing): ${message}`);
  }
}

export const env = parsed.success ? parsed.data : ({} as z.infer<typeof schema>);
