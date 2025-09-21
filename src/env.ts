import { z } from "zod";

/**
 * Centralized runtime env validation.
 * - Keep secrets out of the repo; commit only .env.example
 * - Access via ENV.SOME_VAR, not process.env directly
 */
const envSchema = z.object({
  NODE_ENV: z.enum(["development", "test", "production"]).default("development"),
  // Add your vars here, e.g.:
  // NEXT_PUBLIC_API_BASE: z.string().url().optional(),
});

export const ENV = envSchema.parse(process.env);
