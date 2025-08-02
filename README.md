Grocery App UI – Flutter

A beautifully designed Grocery Shopping App UI built using Flutter as part of the FlutterDevCamp Assignment Week 1.

## ✨ Features

- 📍 Delivery Location UI with Icon
- 🔍 Search Bar with Notification Icon
- 🧃 Category Filters (Meats, Fresh, Bakery, Grains, Organic)
- 🛍️ Dynamic Product List with:
  - Image
  - Name
  - Price
  - Discount
  - Rating
  - Delivery Time
- 🗂️ Separate screens for:
  - Product Details
  - Cart
  - Favorites
  - Profile
- 📱 Bottom Navigation Bar for smooth navigation
- 🔄 Navigation using `go_router`
- 📦 Well-structured folder architecture
- 💡 Reusable widgets

## 📂 Project Structure

lib/
│
├── main.dart
├── models/
│ └── product.dart
├── screens/
│ ├── home_screen.dart
│ ├── product_details_screen.dart
│ ├── cart_screen.dart
│ ├── favorite_screen.dart
│ └── profile_screen.dart
├── widgets/
│ ├── product_card.dart
│ ├── category_filter.dart
│ └── bottom_nav_bar.dart
└── router/
└── app_router.dart
