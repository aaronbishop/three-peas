🌱 Three Peas – Family Cookbook

Three Peas is a family cookbook app built with Ruby on Rails (API backend) and React + Vite (frontend).
It’s designed to be a private recipe-sharing hub where family & friends can contribute, while guests can browse in read-only mode.

✨ Features

👩‍🍳 Recipes with ingredients, directions, prep/cook time, and servings.

🥕 Ingredients nested under recipes.

💬 Comments on recipes (family discussion).

⭐ Favorites system for saving recipes.

🔐 User roles:

    Reader → browse only

    Creator → add/edit recipes & ingredients

    Admin → manage users

🔎 Search recipes & ingredients.

📱 API-first design (React frontend consumes JSON).

🛠 Tech Stack

    Backend: Ruby on Rails 8 (API mode)

    Frontend: React + Vite (planned in /frontend)

    Database: SQLite (development), PostgreSQL (production recommended)

    Auth: Secure password (bcrypt, sessions, role-based access)

🚀 Getting Started
    Prerequisites

        Ruby 3.2+

        Rails 8.0+

        Node.js 18+

        Yarn or npm

Setup

# Clone repo
git clone https://github.com/aaronbishop/three-peas.git
cd three-peas

# Install backend dependencies
bundle install

# Setup DB
bin/rails db:create db:migrate

# Start Rails API server
bin/rails server


The API runs at http://localhost:3000.

Frontend (React + Vite)
    cd frontend
    npm install   # or yarn
    npm run dev   # starts Vite on http://localhost:5173


Vite proxies API calls (/api/v1/...) to Rails (http://localhost:3000).

📡 API Endpoints
Auth

    POST /api/v1/signup – create new user

    POST /api/v1/login – login (session)

    DELETE /api/v1/logout – logout

    GET /api/v1/me – current user

Recipes

    GET /api/v1/recipes

    POST /api/v1/recipes (creators/admins)

    GET /api/v1/recipes/:id

    PATCH /api/v1/recipes/:id (creators/admins)

    DELETE /api/v1/recipes/:id (creators/admins)

    GET /api/v1/recipes/search?q=chili

Ingredients

    GET /api/v1/recipes/:recipe_id/ingredients

    POST /api/v1/recipes/:recipe_id/ingredients (creators/admins)

    GET /api/v1/ingredients/search?q=onion

Comments

    GET /api/v1/recipes/:recipe_id/comments

    POST /api/v1/recipes/:recipe_id/comments (logged-in users)

    DELETE /api/v1/recipes/:recipe_id/comments/:id (owner/admin)

Favorites

    POST /api/v1/recipes/:recipe_id/favorite

    DELETE /api/v1/recipes/:recipe_id/favorite

    GET /api/v1/favorites – list user’s saved recipes

🧭 Roadmap

✅ Recipes + Ingredients CRUD

✅ User authentication & roles

✅ Favorites (save recipes)

✅ Comments system

⏳ React frontend buildout (UI, forms, role-based visibility)

⏳ Recipe categories & tagging

⏳ Image uploads (Active Storage / Cloudinary)

⏳ Deployment (Render, Fly.io, or Heroku alternative)

🤝 Contributing

Family and friends can request access to add recipes.
Others may browse in read-only mode.

📜 License

This project is private and intended for family use only.
All rights reserved. Please do not copy, distribute, or use without permission.