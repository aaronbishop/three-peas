import { useEffect, useState } from "react";
import { AuthContext } from "./AuthContext";
import { apiRequest } from "../services/api";

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    apiRequest("/me")
      .then((data) => {
        setUser(data.user);
        if (data.token) localStorage.setItem("token", data.token);
      })
      .catch(() => setUser(null))
      .finally(() => setLoading(false));
  }, []);

  const login = async (email, password) => {
    const data = await apiRequest("/login", {
      method: "POST",
      body: JSON.stringify({ email, password }),
    });
    setUser(data.user);
    if (data.token) localStorage.setItem("token", data.token);
    return data.user;
  };

  const signup = async (email, password, passwordConfirmation) => {
    const data = await apiRequest("/signup", {
      method: "POST",
      body: JSON.stringify({
        user: { email, password, password_confirmation: passwordConfirmation },
      }),
    });
    setUser(data.user);
    if (data.token) localStorage.setItem("token", data.token);
    return data.user;
  };

  const logout = async () => {
    await apiRequest("/logout", { method: "DELETE" });
    setUser(null);
    localStorage.removeItem("token");
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, signup, logout }}>
      {children}
    </AuthContext.Provider>
  );
}
