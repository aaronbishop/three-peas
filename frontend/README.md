🌱 Three Peas Frontend (React + Vite)

This is the frontend for the Three Peas Family Cookbook.
It’s a React + Vite single-page app (SPA) that consumes the Rails API (/api/v1/...).

🚀 Getting Started
Prerequisites

Node.js 18+

npm or yarn

Setup

# Go into frontend folder
cd frontend

# Install dependencies
npm install    # or yarn

# Start dev server
npm run dev


The app will be available at:
👉 http://localhost:5173

🔌 API Proxy Setup

Vite is configured to proxy API requests to Rails (running at http://localhost:3000).

So any request like:

fetch("/api/v1/recipes")


will automatically forward to your Rails backend.

📂 Project Structure
frontend/
├── src/
│   ├── components/    # Shared UI components
│   ├── pages/         # Page-level views (Recipes, Login, etc.)
│   ├── hooks/         # Custom React hooks
│   ├── services/      # API request helpers
│   ├── App.jsx        # Main app shell
│   └── main.jsx       # Entry point
├── index.html
├── package.json
└── vite.config.js

🧭 Roadmap (Frontend)

✅ Connect to Rails API

⏳ Authentication flow (signup/login/logout)

⏳ Recipe list + detail pages

⏳ Ingredient forms

⏳ Comments section

⏳ Favorites (save/unsave recipes)

⏳ User profile + role-based UI (Reader / Creator / Admin)

⏳ Styling (TailwindCSS or similar)

⏳ Deployment

📜 License

This frontend is part of the private Three Peas Family Cookbook project.
All rights reserved. Please do not copy, distribute, or use without permission.