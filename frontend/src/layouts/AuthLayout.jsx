import { Outlet } from "react-router-dom";

export default function AuthLayout() {
  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <div className="w-full max-w-md bg-white shadow p-6 rounded">
        <Outlet /> {/* login/signup will render here */}
      </div>
    </div>
  );
}
