# Google Sign-In Example with Firebase Authentication

This Flutter project demonstrates how to integrate Google Sign-In using Firebase Authentication. Users can sign in with their Google accounts and view their profile information.

## Getting Started

1. **Firebase Setup**:
    - Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    - Add your Android app to the project and download the `google-services.json` file.
    - Configure your iOS app by adding the `GoogleService-Info.plist` file.
    - Enable Google Sign-In in the Firebase Authentication section.

2. **Flutter Setup**:
    - Make sure you have Flutter and Dart installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
    - Clone this repository or create a new Flutter project.
    - Replace the existing `google-services.json` and `GoogleService-Info.plist` files with your own.

3. **Dependencies**:
    - Add the necessary dependencies to your `pubspec.yaml` file:

        ```yaml
        dependencies:
          flutter:
            sdk: flutter
            firebase_core: 
            firebase_auth: 
            sign_in_button: 
        ```

4. **Run the App**:
    - Connect a physical device or start an emulator.
    - Run the app using `flutter run`.

## Features

- Google Sign-In button using the `sign_in_button` package.
- Firebase Authentication integration.
- Display user profile information (email, display name, and profile picture).
- Sign out functionality.

## Contributing

Contributions are welcome! If you find any issues or want to enhance the project, feel free to submit a pull request.

## License

This project is licensed under the MIT License.

Happy coding! 🚀🔥
