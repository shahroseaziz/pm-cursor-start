import { describe, it, expect } from "vitest";
import { greet } from "../src/lib/hello";

describe("greet", () => {
  it("greets by name", () => {
    expect(greet("Ada")).toBe("Hello, Ada!");
  });

  it("falls back to world", () => {
    expect(greet("  ")).toBe("Hello, world!");
  });
});
