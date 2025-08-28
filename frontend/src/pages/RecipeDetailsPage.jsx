// src/pages/RecipeDetailsPage.jsx
import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { getRecipe } from "../services/recipes";
import FavoriteToggle from "../components/FavoriteToggle";
import { useAuth } from "../context/useAuth";

export default function RecipeDetailsPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [recipe, setRecipe] = useState(null);
  const [error, setError] = useState("");
  const { user, loading } = useAuth();

  useEffect(() => {
    if (loading) return; // wait until auth resolves

    if (!user) {
      navigate("/login");
      return;
    }

    getRecipe(id)
      .then(setRecipe)
      .catch((err) => {
        console.error(err);
        setError(err.message || "Could not load recipe.");
      });
  }, [id, user, loading, navigate]);

  if (loading) {
    return (
      <div className="max-w-2xl mx-auto p-6 text-center">
        Loading recipe...
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

  if (!recipe) {
    return (
      <div className="max-w-2xl mx-auto p-6 text-center">
        Loading recipe...
      </div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto p-6 bg-white shadow rounded mt-10">
      <div className="flex items-center justify-between mb-4">
        <h2 className="text-3xl font-bold">{recipe.name}</h2>
        {!loading && user && <FavoriteToggle recipeId={id} />}
      </div>

      <p className="mb-2 text-gray-700">
        <span className="font-semibold">Prep:</span> {recipe.prep_time} |{" "}
        <span className="font-semibold">Cook:</span> {recipe.cook_time} |{" "}
        <span className="font-semibold">Servings:</span> {recipe.servings}
      </p>

      <h3 className="text-xl font-semibold mt-6 mb-2">Ingredients</h3>
      <ul className="list-disc list-inside mb-4">
        {recipe.ingredients?.map((ing) => (
          <li key={ing.id}>
            {ing.quantity} {ing.measurement} {ing.name}
          </li>
        ))}
      </ul>

      <h3 className="text-xl font-semibold mt-6 mb-2">Directions</h3>
      <p className="whitespace-pre-line">{recipe.directions}</p>
    </div>
  );
}
