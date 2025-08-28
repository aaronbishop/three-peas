// src/pages/FavoritesPage.jsx
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { getFavorites } from "../services/favorites";
import { useAuth } from "../context/useAuth";
import RecipeCard from "../components/RecipeCard";

export default function FavoritesPage() {
  const [favorites, setFavorites] = useState([]);
  const [error, setError] = useState("");
  const { user, loading } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (loading) return; // wait until auth state is resolved

    if (!user) {
      navigate("/login");
      return;
    }

    getFavorites()
      .then(setFavorites)
      .catch((err) => {
        console.error(err);
        setError(err.message || "Could not load favorites.");
      });
  }, [user, loading, navigate]);

  if (loading) {
    return (
      <div className="max-w-2xl mx-auto p-6 text-center">
        Loading your favorites...
      </div>
    );
  }

  if (error) {
    return (
      <div className="max-w-2xl mx-auto p-6 text-center text-red-600">
        {error}
      </div>
    );
  }

  if (favorites.length === 0) {
    return (
      <div className="max-w-2xl mx-auto p-6 text-center">
        No favorite recipes yet.
      </div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto p-6">
      <h2 className="text-3xl font-bold mb-6">Your Favorites</h2>
      <div className="space-y-4">
        {favorites.map((recipe) => (
          <RecipeCard key={recipe.id} recipe={recipe} />
        ))}
      </div>
    </div>
  );
}
