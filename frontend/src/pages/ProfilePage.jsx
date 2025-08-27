import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { getCurrentUser, logout } from "../services/auth";

export default function ProfilePage() {
  const [user, setUser] = useState(null);
  const [error, setError] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    getCurrentUser()
      .then(setUser)
      .catch((err) => {
        console.error("Error fetching user:", err);
        setError("You must be logged in to view your profile.");
      });
  }, []);

  async function handleLogout() {
    try {
      await logout();
      navigate("/login"); // redirect after logout
    } catch (err) {
      console.error("Logout failed:", err);
      setError("Failed to log out. Try again.");
    }
  }

  if (error) {
    return (
      <div className="max-w-md mx-auto p-6 bg-white shadow rounded mt-10 text-center">
        <p className="text-red-600">{error}</p>
      </div>
    );
  }

  if (!user) {
    return (
      <div className="max-w-md mx-auto p-6 bg-white shadow rounded mt-10 text-center">
        <p>Loading your profile...</p>
      </div>
    );
  }

  return (
    <div className="max-w-md mx-auto p-6 bg-white shadow rounded mt-10">
      <h2 className="text-2xl font-bold mb-4">Your Profile</h2>
      <p className="mb-2">
        <span className="font-semibold">Email:</span> {user.email}
      </p>
      <p className="mb-6">
        <span className="font-semibold">Role:</span>{" "}
        {user.role === 0 ? "Reader" : user.role === 1 ? "Creator" : "Admin"}
      </p>

      <button
        onClick={handleLogout}
        className="w-full bg-red-600 text-white py-2 rounded hover:bg-red-700 transition"
      >
        Logout
      </button>
    </div>
  );
}
