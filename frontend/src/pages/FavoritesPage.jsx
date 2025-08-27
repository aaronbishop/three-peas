import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

export default function FavoritesPage() {
  const [favorites, setFavorites] = useState([]);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch("/api/v1/recipes/favorites")
      .then((res) => {
        if (!res.ok) throw new Error("Failed to fetch favorites");
        return res.json();
      })
      .then(setFavorites)
      .catch((err) => {
        console.error(err);
        setError("Could not load favorites.");
      });
  }, []);

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
      <ul className="space-y-4">
        {favorites.map((recipe) => (
          <li
            key={recipe.id}
            className="border rounded p-4 hover:bg-gray-50 transition"
          >
            <Link
              to={`/recipes/${recipe.id}`}
              className="text-xl font-semibold text-green-700 hover:underline"
            >
              {recipe.name}
            </Link>
            <p className="text-sm text-gray-600">{recipe.prep_time} prep</p>
          </li>
        ))}
      </ul>
    </div>
  );
}
