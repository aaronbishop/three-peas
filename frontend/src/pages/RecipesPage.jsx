import { useEffect, useState } from "react";
import { getRecipes } from "../services/recipes";
import RecipeCard from "../components/RecipeCard";

export default function RecipesPage() {
  const [recipes, setRecipes] = useState([]);

  useEffect(() => {
    getRecipes().then(setRecipes).catch(console.error);
  }, []);

  return (
    <div className="p-6">
      <h2 className="text-2xl font-bold mb-4">Recipes</h2>
      <div className="grid gap-4 md:grid-cols-2">
        {recipes.map((r) => (
          <RecipeCard key={r.id} recipe={r} />
        ))}
      </div>
    </div>
  );
}
