# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Basic Commands
- `flutter pub get` - Install dependencies
- `flutter run` - Run the app on emulator/device
- `flutter test` - Run unit tests
- `flutter analyze` - Run static analysis

### Code Generation
- `dart run build_runner build` - Generate code for models, repositories, and routing
- `dart run build_runner build --delete-conflicting-outputs` - Force regenerate all generated files

### Widget Book
- `flutter run -d chrome -t lib/widgetbook.dart` - Run the widget book for UI component development

## Architecture

This Flutter app follows Layered Architecture based on the [Flutter Architecture Guild](https://docs.flutter.dev/app-architecture/guide):

- **UI Layer**: Screens and ViewModels using Riverpod for state management
- **Data Layer**: Repositories, API services (Retrofit), and local database (Isar)

Key patterns:
- ViewModels use `riverpod_annotation` and `riverpod_generator` for code generation
- Models use `freezed` and `json_annotation` for immutable data classes with JSON serialization
- Network layer uses `retrofit` with `dio` for HTTP requests
- Local storage uses `isar` database
- Routing uses `go_router` with code generation
- Dependency injection via `get_it`

## File Structure

- `lib/main.dart` - App entry point with routing setup
- `lib/data/` - Data layer (models, repositories, API services, local storage)
  - `lib/data/infra/` - API services and network responses
  - `lib/data/local/` - Local database and storage
  - `lib/data/model/` - Domain models and data classes
  - `lib/data/repository/` - Repository implementations
- `lib/ui/` - UI layer (screens, ViewModels, design system)
  - `lib/ui/route/` - Go router configuration and route definitions
  - `lib/ui/designsystem/` - Design tokens and reusable UI components
  - `lib/ui/viewstate/` - State classes for ViewModels
- `test/` - Unit tests organized to mirror lib/ structure

## Generated Files

Files ending in `.g.dart`, `.freezed.dart`, and `.directories.g.dart` are generated. Run code generation after modifying:
- Models with `@freezed` or `@JsonSerializable` annotations
- ViewModels with `@riverpod` annotations
- Routes in `lib/ui/route/routes.dart`
- Widgetbook components

## Testing

Tests use `mockito` for mocking dependencies. Mock files are generated with `.mocks.dart` suffix.
Run `dart run build_runner build` to regenerate mocks after changing test dependencies.

## Mock Data

Mock beverage data is stored in `json/mock/beverage_mock.json` for development and testing.