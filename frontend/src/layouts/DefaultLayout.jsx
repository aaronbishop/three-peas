import { Outlet } from "react-router-dom";
import Navbar from "../components/Navbar";

export default function DefaultLayout() {
  return (
    <div>
      <Navbar />
      <main className="p-6">
        <Outlet /> {/* child routes will render here */}
      </main>
    </div>
  );
}
