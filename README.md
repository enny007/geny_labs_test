# Geny Labs Test

A Flutter application for browsing and managing business directories with contact information.

## Features

- 📋 **Business Directory**: Browse a list of businesses with their details
- 📞 **Contact Information**: View business names, locations, and phone numbers
- 🔄 **Real-time Updates**: Reactive UI with Provider state management
- ⚡ **Fast Loading**: Optimized with singleton DioClient and local asset loading
- 🔄 **Error Handling**: Robust error states with retry functionality
- 📱 **Responsive Design**: Material Design with loading and empty states

## Screenshots

*Add screenshots of your app here*

## Getting Started

### Prerequisites

- Flutter SDK (^3.7.0)
- Dart SDK (included with Flutter)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd geny_labs_test
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# Android APK
flutter build apk --release

# iOS (on macOS)
flutter build ios --release

# Web
flutter build web --release
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── http/
│   └── dio_client.dart    # HTTP client (Singleton)
├── model/
│   └── business_model.dart # Data models
├── provider/
│   └── business_provider.dart # State management
├── view/
│   ├── views/            # Screen widgets
│   └── widgets/          # Reusable components
└── local_data/
    └── local_storage.dart # Local storage service
```

## Architecture

This app uses:
- **MVVM Pattern** with Provider for state management
- **Singleton DioClient** for optimized HTTP operations
- **Clean Architecture** with separated concerns
- **Local Asset Loading** for offline capability

## Dependencies

- `dio`: HTTP client for network requests
- `provider`: State management solution
- `shared_preferences`: Local storage (ready for offline features)

## Usage

1. Launch the app
2. View the list of businesses loaded from local assets
3. Tap on any business to see detailed information
4. Use the retry button if loading fails

## Development

### Code Quality

The project uses:
- Flutter lints for code quality
- Strong typing with null safety
- Comprehensive error handling

### Testing

```bash
# Run tests
flutter test

# Run integration tests
flutter test integration_test/
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## Documentation

For detailed technical documentation, see [TECH_NOTES.md](TECH_NOTES.md)

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or issues, please open an issue on GitHub.
