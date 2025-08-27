import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav className="bg-green-700 text-white px-6 py-3 shadow-md">
      <div className="flex justify-between items-center max-w-5xl mx-auto">
        {/* Logo / Brand */}
        <Link to="/" className="text-2xl font-bold">
          🌱 Three Peas
        </Link>

        {/* Links */}
        <div className="flex space-x-4">
          <Link to="/recipes" className="hover:underline">
            Recipes
          </Link>
          <Link to="/favorites" className="hover:underline">
            Favorites
          </Link>
          <Link to="/profile" className="hover:underline">
            Profile
          </Link>
          <Link to="/login" className="hover:underline">
            Login
          </Link>
          <Link to="/signup" className="hover:underline">
            Signup
          </Link>
        </div>
      </div>
    </nav>
  );
}
