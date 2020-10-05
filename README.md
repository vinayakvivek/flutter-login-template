# flutter_login_template
> <img src="assets/auth_logo.png" width="48">

A starter code for flutter apps with auth.
Built on top of [login example](https://github.com/felangel/bloc/tree/master/examples/flutter_firebase_login) in Bloc library.
- Auth methods are implemented in the sub-package [authentication_repository](https://github.com/vinayakvivek/flutter-login-template/tree/master/packages/authentication_repository)

## Features
- Firebase auth
  - Email/password
  - Google
  - Facebook
- Sample login and sign-up forms, Change the design to suit your app design.
- Bloc based.

## How do I make this work in my local machine
- Fix a valid package name for your project (required in firebase)
  - It's `com.direvin.flutter_login_template` in this
  - Format must be: `com.<company>.<project>`
- Go to you firebase console, create a new project.
  - Create an Android app and an iOS app.
    - Save both `google-services.json` (android), `GoogleService-Info.plist` (ios) into your system.
  - Enable `Email/password`, `Google` and `Facebook` sign-in methods in firebase console -> authentication tab.
    - To enable `Facebook` login, you would have to create a new app in facebook developer console and get the AppID and AppSecret
- Run the update script
  ```
  ./update.sh <App Name> <path to google-services.json> <path to GoogleService-Info.plist> <FBAppID>
  ```
  > This scripts updates package name and other required fields in both android and ios directories. If you don't want to run this, in the following section, I've described the steps I followed.
- Done. Now you can build and run your App with authentication in both Android and iOS 🍻.

### **[Only for reference]** Steps to update the project with your App details
- Go to the firebase console, create a new project.
  - **Android**:
    - In firebase console, create an android app,
    - Save `google-services.json` to `android/app/`
  - **iOS**:
    - Create an iOS app in firebase console
    - Save `GoogleService-Info.plist` to `ios/` directory
- Change the package name in this project
  - Checkout [these](https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter)
  - **Android**
    - In `app/build.gradle`, update `android > defaultConfig > applicationId` with your package name.
    - Update package name in the Manifest files.
      - `android/app/src/profile/AndroidManifest.xml`
      - `android/app/src/main/AndroidManifest.xml`
      - `android/app/src/debug/AndroidManifest.xml`
    - Update App name in `android/app/src/main/res/values/strings.xml`
    - Rename package in the MainActivity `android/app/src/main/kotlin/com/direvin/flutter_login_template/MainActivity.kt`
      - Change it's parent directory name as well
  - **iOS**
    - Update references in `Info.plist`
      - Update `CFBundleURLSchemes` array with `REVERSED_CLIENT_ID` value from `GoogleService-Info.plist`
    - Update `PRODUCT_BUNDLE_IDENTIFIER` variables in `ios/Runner.xcodeproj/project.pbxproj`

- Enable `Email/password`, `Google` and `Facebook` sign-in methods in firebase console -> authentication tab.
  - To enable `Facebook` login, you would have to create a new app in facebook developer console and get the AppID and AppSecret, update these values in the following files. For more info, visit the [flutter_facebook_login](https://github.com/roughike/flutter_facebook_login) library README.
    - `android/app/src/main/res/values/strings.xml`
    - `ios/Info.plist`

## Change App icon
  - Add your logo image to the `assets/` directory
  - In `pubspec.yaml`, update `flutter_icons -> image_path` to the relative path of your logo
  - run `flutter pub run flutter_launcher_icons:main`


**Steps I followed to create this are here: [DOCS](https://github.com/vinayakvivek/flutter-login-template/blob/master/DOCS.md)**
