import test from "node:test";
import assert from "node:assert/strict";
import { handleApi } from "../src/index.js";

test("GET /api/health は D1 未接続でも稼働確認を返す", async () => {
  const response = await handleApi(new Request("https://example.test/api/health"), {});

  assert.equal(response.status, 200);
  assert.deepEqual(await response.json(), { status: "ok", storage: "not-configured" });
});

test("未定義 API は 404 を返す", async () => {
  const response = await handleApi(new Request("https://example.test/api/unknown"), {});

  assert.equal(response.status, 404);
});
