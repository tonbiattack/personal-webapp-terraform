export function response(statusCode, body) {
  return {
    statusCode,
    headers: { "content-type": "application/json; charset=utf-8" },
    body: JSON.stringify(body),
  };
}

export async function handler(event) {
  const requestId = event.requestContext?.requestId ?? "local";

  if (event.requestContext?.http?.method !== "GET") {
    return response(405, { error: "method_not_allowed", requestId });
  }

  if (event.rawPath !== "/health") {
    return response(404, { error: "not_found", requestId });
  }

  return response(200, { status: "ok", requestId });
}
