import { apiRequest } from "./api";

export const getRecipes = () => apiRequest("/recipes");
export const getRecipe = (id) => apiRequest(`/recipes/${id}`);

export const createRecipe = (recipe) =>
  apiRequest("/recipes", {
    method: "POST",
    body: JSON.stringify(recipe),
  });

export const updateRecipe = (id, recipe) =>
  apiRequest(`/recipes/${id}`, {
    method: "PATCH",
    body: JSON.stringify(recipe),
  });

export const deleteRecipe = (id) =>
  apiRequest(`/recipes/${id}`, { method: "DELETE" });
