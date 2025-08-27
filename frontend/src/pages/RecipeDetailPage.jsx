import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

export default function RecipeDetailsPage() {
  const { id } = useParams();
  const [recipe, setRecipe] = useState(null);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch(`/api/v1/recipes/${id}`)
      .then((res) => {
        if (!res.ok) throw new Error("Failed to fetch recipe");
        return res.json();
      })
      .then(setRecipe)
      .catch((err) => {
        console.error(err);
        setError("Could not load recipe.");
      });
  }, [id]);

  if (error) {
    return (
      <div className="max-w-2xl mx-auto p-6 text-center text-red-600">
        {error}
      </div>
    );
  }

  if (!recipe) {
    return (
      <div className="max-w-2xl mx-auto p-6 text-center">Loading recipe...</div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto p-6 bg-white shadow rounded mt-10">
      <h2 className="text-3xl font-bold mb-4">{recipe.name}</h2>
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
