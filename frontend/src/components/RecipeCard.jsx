// src/components/RecipeCard.jsx
import { Link } from "react-router-dom";
import FavoriteToggle from "./FavoriteToggle";
import { useAuth } from "../context/useAuth";

export default function RecipeCard({ recipe }) {
  const { user, loading } = useAuth(); // include loading state

  return (
    <div className="p-4 bg-white shadow rounded-lg flex flex-col justify-between">
      <div>
        <div className="flex items-center justify-between">
          <h3 className="text-lg font-semibold">
            <Link to={`/recipes/${recipe.id}`} className="hover:underline">
              {recipe.name}
            </Link>
          </h3>
          {!loading && user && <FavoriteToggle recipeId={recipe.id} />} {/* Only render star if we finished loading AND user exists */}
        </div>
        {recipe.prep_time && (
          <p className="text-sm text-gray-600">Prep: {recipe.prep_time}</p>
        )}
        {recipe.cook_time && (
          <p className="text-sm text-gray-600">Cook: {recipe.cook_time}</p>
        )}
      </div>
    </div>
  );
}
