import { useEffect, useState } from "react";
import { getFavorites, addFavorite, removeFavorite } from "../services/favorites";
import { useAuth } from "../context/useAuth";

export default function FavoriteToggle({ recipeId }) {
  const { user, loading } = useAuth();
  const [isFavorite, setIsFavorite] = useState(false);
  const [pending, setPending] = useState(false);

  useEffect(() => {
    if (!user) return; // don’t check if not logged in
    getFavorites()
      .then((favs) => {
        if (favs.some((r) => r.id === parseInt(recipeId))) {
          setIsFavorite(true);
        }
      })
      .catch((err) => console.error("Failed to load favorites", err));
  }, [user, recipeId]);

  const toggleFavorite = async () => {
    if (!user) return;
    setPending(true);
    try {
      if (isFavorite) {
        await removeFavorite(recipeId);
        setIsFavorite(false);
      } else {
        await addFavorite(recipeId);
        setIsFavorite(true);
      }
    } catch (err) {
      console.error(err);
      alert("Failed to update favorite status");
    } finally {
      setPending(false);
    }
  };

  if (loading || !user) return null; // hide if loading or not logged in

  return (
    <button
      onClick={toggleFavorite}
      disabled={pending}
      className="text-2xl focus:outline-none"
    >
      {isFavorite ? "★" : "☆"}
    </button>
  );
}
