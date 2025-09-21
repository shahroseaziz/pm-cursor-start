export function greet(name: string) {
    const n = name?.trim();
    return `Hello, ${n || "world"}!`;
  }
  