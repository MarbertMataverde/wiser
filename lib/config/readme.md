### Welcome to the Wiser Repository!

To get started with the project, please follow these instructions:

1. Clone the Wiser repository to your local machine.
2. Generate the `firebase_config.dart` file using the Firebase CLI.
3. Create a new file named `firebase_config.dart` in the `lib/config` directory.
4. Copy the code snippet provided below and paste it into the `firebase_config.dart` file:

```dart
class FirebaseConfig<Name of Platform(Android, iOS, Web)> {
  static const String apiKey = 'YOUR_API_KEY';
  static const String appId = 'YOUR_APP_ID';
  static const String messagingSenderId = 'YOUR_SENDER_ID';
  static const String projectId = 'YOUR_PROJECT_ID';
  static const String authDomain = 'YOUR_AUTH_DOMAIN';
  static const String storageBucket = 'YOUR_STORAGE_BUCKET';
  static const String measurementId = 'YOUR_MEASUREMENT_ID';
}
```

6. Replace 'YOUR_API_KEY', 'YOUR_APP_ID', and other placeholders with the actual values from your Firebase project.
7. Make sure to customize the values for each platform (Android, iOS, Web) accordingly.

Note: The firebase_config.dart file is not included in the repository to protect sensitive information. By following the above steps, you will create your own firebase_config.dart file with your Firebase project details.

Please ensure that you keep this file private and do not share it publicly, as it contains important information for the functioning of the app.