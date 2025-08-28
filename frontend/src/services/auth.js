import { apiRequest } from "./api";

export const login = (email, password) =>
  apiRequest("/login", {
    method: "POST",
    body: JSON.stringify({ email, password }),
  });

export const signup = (email, password) =>
  apiRequest("/signup", {
    method: "POST",
    body: JSON.stringify({ email, password }),
  });

export const logout = () => apiRequest("/logout", { method: "DELETE" });

export const getCurrentUser = () => apiRequest("/me");
