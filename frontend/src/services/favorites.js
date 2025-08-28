// src/services/favorites.js
import { apiRequest } from "./api";

// List current user's favorites
export const getFavorites = () => apiRequest("/favorites");

// Add a recipe to favorites
export const addFavorite = (recipeId) =>
  apiRequest(`/recipes/${recipeId}/favorite`, { method: "POST" });

// Remove a recipe from favorites
export const removeFavorite = (recipeId) =>
  apiRequest(`/recipes/${recipeId}/favorite`, { method: "DELETE" });
