# Pharma Store Administration Web 💊

A Flutter web admin dashboard for managing a pharmacy distribution network — products, inventory, pharmacies, stores, and orders — all from a single responsive panel.

---

## Features

**Authentication**
- Login screen
- Forgot password flow (OTP verification → reset password → success confirmation)

**Dashboard**
- Overview screen with charts (Syncfusion Flutter Charts) summarizing store activity

**Products**
- Product list with categories
- Add / edit / view product details
- Product inventory tab with detailed inventory tracking per product
- Product category management (add, edit, view, confirm categories)

**Pharmacies**
- List and manage registered pharmacies

**Stores**
- List and manage stores, with detailed store options

**Orders**
- Order list with detailed order view per order

**Notifications**
- Notification center screen

**Settings**
- User profile management screen

**UI/UX**
- Collapsible sidebar navigation (`sidebarx`)
- Paginated tables/lists (`number_paginator`)
- Custom dropdowns (`dropdown_button2`) and side-sheet modals (`modal_side_sheet`)
- Password strength indicator on auth screens
- Bilingual-ready typography: **Cairo** (Arabic) and **Poppins** (Latin) fonts
- SVG icon support and custom icon font

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter Web (Dart) |
| State Management | BLoC / Cubit (`flutter_bloc`, `bloc`) |
| Charts | `syncfusion_flutter_charts` |
| Networking | `http` |
| Local Storage | `shared_preferences` |
| Navigation | `sidebarx` (sidebar layout) |
| UI Helpers | `dropdown_button2`, `modal_side_sheet`, `number_paginator`, `flutter_svg`, `hexcolor`, `password_strength_indicator` |

---

## Project Structure

```
lib/
├── main.dart
├── layouts/                       # App shell / sidebar layout
├── models/                        # Data models
├── shared/                        # Shared widgets, constants, network/cubit helpers
└── modules/
    ├── 0-auth_module/
    │   ├── 1-login_screen/
    │   └── 2-forgot_password/     # OTP, reset, success screens
    ├── 1-dashboard_screen/        # Charts & overview
    ├── 2-product_module/
    │   ├── product_tab/           # Product list, add/edit/details, categories
    │   └── product_inventory_tab/ # Inventory tracking
    ├── 3-pharmacy_module/         # Pharmacy list & options
    ├── 4-store_module/            # Store list & options
    ├── 5-order_module/            # Orders & order details
    ├── 7-settings_module/         # User profile
    └── 8-notification_module/     # Notifications
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK `>=3.3.1 <4.0.0`)
- Chrome (or another browser) for running Flutter Web
- A backend REST API endpoint (configure the base URL in the networking layer under `lib/shared/`)

### 1 — Clone the repository

```bash
git clone https://github.com/YoussefElqursh/pharma_store_adminstration_web.git
cd pharma_store_adminstration_web
```

### 2 — Install dependencies

```bash
flutter pub get
```

### 3 — Run the app (Web)

```bash
flutter run -d chrome
```

### 4 — Build for production

```bash
flutter build web --release
```

The build output will be in `build/web/`, ready to deploy to any static hosting (Firebase Hosting, Netlify, Vercel, etc.).

---

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

---

## License

This project is open-source. See [LICENSE](LICENSE) for details.
