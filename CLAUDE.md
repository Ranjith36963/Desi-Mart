# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Dev Commands

```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/features/auth/services/auth_service_test.dart

# Run tests with coverage
flutter test --coverage

# Get dependencies
flutter pub get

# Analyze code (linting)
flutter analyze

# Run on web (useful in Codespaces/headless environments)
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0

# Run on connected device
flutter run
```

## Architecture

**Feature-first modular architecture** using Riverpod for state management and GoRouter for navigation.

### Core Pattern

Each feature module (`lib/features/<feature>/`) follows this structure:
- `screens/` — Page-level `ConsumerWidget` or `ConsumerStatefulWidget`
- `widgets/` — Feature-specific UI components (plain `StatelessWidget`)
- `providers/` — Riverpod providers (Provider, StateProvider, StreamProvider, FutureProvider)
- `services/` — Abstract interface + implementation (currently mock/local, designed for Firebase swap)
- `models/` — Data classes with `fromMap`/`toMap` factories and `copyWith`

### State Management (Riverpod)

- `Provider` for service injection (e.g., `authServiceProvider`)
- `StreamProvider` for auth state (`authStateProvider`)
- `FutureProvider` for async data (e.g., `offersProvider`)
- `StateProvider` for simple mutable state (e.g., `stampCountProvider`)
- Screens use `ref.watch()` for reactive rebuilds; async data uses `.when(loading:, error:, data:)`

### Routing (GoRouter)

Defined in `lib/core/router/app_router.dart`. Auth redirect logic sends unauthenticated users to `/login`. A `StatefulShellRoute` manages 4-tab bottom navigation (`/home`, `/offers`, `/loyalty`, `/store`) with `IndexedStack` to preserve tab state.

### Service Abstraction

Services use an abstract interface pattern so implementations can be swapped (mock → Firebase):
```
AuthService (abstract) → MockAuthService (current)
OffersService (abstract) → LocalOffersService (current)
```
Providers wire the active implementation: `Provider<AuthService>((ref) => MockAuthService())`

### Theme & Design System

- `AppColours` — Brand palette (saffron orange, green, cream), semantic colors, tag colors with `tagColour()` helper
- `AppTheme.lightTheme` — Playfair Display headings (Google Fonts), Poppins body, 12-16px border radius
- `AppConstants` — Store info, hours, categories, brands, offers, loyalty config (single source of truth for all hardcoded data)

### Firebase Status

Firebase packages are in pubspec.yaml but use placeholder config (`firebase_options.dart`). All services are currently mocked. To activate: run `flutterfire configure` and swap mock services for Firebase implementations in providers.

## Linting

Uses `flutter_lints` with strict rules: `prefer_const_constructors`, `avoid_print`, `prefer_single_quotes`, `sort_child_properties_last`, `use_key_in_widget_constructors`. Run `flutter analyze` to check.
