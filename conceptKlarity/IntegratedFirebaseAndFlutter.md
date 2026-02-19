# Integrated Firebase and Flutter

## Overview

This project demonstrates the integration of Firebase services with a Flutter application.

## Firebase Services Used

- **Firebase Authentication** - For user sign-in and sign-up functionality
- **Firebase Core** - Core Firebase SDK for Flutter

## Setup Steps

1. Created a Firebase project in the Firebase Console
2. Added Android app configuration with `google-services.json`
3. Added iOS app configuration with `GoogleService-Info.plist`
4. Installed required Flutter packages:
   - `firebase_core`
   - `firebase_auth`

## Implementation

Firebase is initialized in the `main.dart` file before running the app:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

## Benefits of Firebase + Flutter Integration

- Cross-platform authentication support
- Real-time data synchronization
- Scalable backend infrastructure
- Easy-to-use SDK and documentation
