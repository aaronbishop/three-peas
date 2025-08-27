import { Link } from "react-router-dom";

export default function HomePage() {
  return (
    <div className="max-w-3xl mx-auto p-8 text-center">
      <h1 className="text-4xl font-bold mb-4">🌱 Welcome to Three Peas</h1>
      <p className="text-lg text-gray-700 mb-8">
        A family cookbook where we share recipes, stories, and a little bit of love.  
        Family and friends can add new recipes, while guests can browse our collection.
      </p>

      <div className="flex justify-center gap-4">
        <Link
          to="/recipes"
          className="bg-green-700 text-white px-6 py-2 rounded-lg shadow hover:bg-green-800 transition"
        >
          Browse Recipes
        </Link>
        <Link
          to="/login"
          className="bg-gray-200 text-gray-800 px-6 py-2 rounded-lg shadow hover:bg-gray-300 transition"
        >
          Login
        </Link>
      </div>
    </div>
  );
}
