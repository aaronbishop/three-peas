// src/services/api.js
export async function apiRequest(path, options = {}) {
  const token = localStorage.getItem("token"); // JWT if present
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
    ...(token ? { Authorization: `Bearer ${token}` } : {}),
    ...options.headers,
  };

  const res = await fetch(`/api/v1${path}`, {
    credentials: "include", // supports cookies now, JWT later
    ...options,
    headers,
  });

  if (!res.ok) {
    let errorMessage = `Request failed with status ${res.status}`;
    try {
      const errorData = await res.json();
      errorMessage =
        errorData.error || errorData.errors?.join(", ") || errorMessage;
    } catch (err) {
      console.warn("Failed to parse error response", err);
    }
    const error = new Error(errorMessage);
    error.status = res.status;
    throw error;
  }

  // Handle 204 No Content (logout, deletes, etc.)
  if (res.status === 204) return null;

  return res.json();
}
