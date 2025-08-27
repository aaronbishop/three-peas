// src/components/RecipeCard.jsx
export default function RecipeCard({ recipe }) {
  return (
    <div className="border rounded p-4 shadow bg-white">
      <h3 className="text-xl font-bold">{recipe.name}</h3>
      <p className="text-gray-600">Servings: {recipe.servings}</p>
      <p className="line-clamp-3">{recipe.directions}</p>
    </div>
  );
}
