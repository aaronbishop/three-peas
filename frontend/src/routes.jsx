import {
  HomePage,
  RecipesPage,
  RecipeDetailsPage,
  LoginPage,
  SignupPage,
  FavoritesPage,
  ProfilePage,
  NotFoundPage,
} from "./pages";

import { DefaultLayout, AuthLayout } from "./layouts";
import { ProtectedRoute } from "./components";

const routes = [
  {
    element: <DefaultLayout />,
    children: [
      { path: "/", element: <HomePage /> },
      { path: "/recipes", element: <RecipesPage /> },
      { path: "/recipes/:id", element: <RecipeDetailsPage /> },
      {
        path: "/favorites",
        element: (
          <ProtectedRoute>
            <FavoritesPage />
          </ProtectedRoute>
        ),
      },
      {
        path: "/profile",
        element: (
          <ProtectedRoute>
            <ProfilePage />
          </ProtectedRoute>
        ),
      },
      { path: "*", element: <NotFoundPage /> },
    ],
  },
  {
    element: <AuthLayout />,
    children: [
      { path: "/login", element: <LoginPage /> },
      { path: "/signup", element: <SignupPage /> },
    ],
  },
];

export default routes;
