import test from "node:test";
import assert from "node:assert/strict";
import { handler } from "../src/index.mjs";

test("GET /health は稼働確認を返す", async () => {
  const result = await handler({
    rawPath: "/health",
    requestContext: { requestId: "test-id", http: { method: "GET" } },
  });

  assert.equal(result.statusCode, 200);
  assert.deepEqual(JSON.parse(result.body), { status: "ok", requestId: "test-id" });
});

test("未定義パスは 404 を返す", async () => {
  const result = await handler({
    rawPath: "/unknown",
    requestContext: { http: { method: "GET" } },
  });

  assert.equal(result.statusCode, 404);
});
