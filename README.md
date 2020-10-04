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
- Change the package name to whatever suits
  - It's `com.direvin.flutter_login_template` now
  - Follow these stackoverflow [answers](https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter)
- Go to the firebase console, create a new project.
  - **Android**:
    - In firebase console, create an android app,
    - Save `google-services.json` to `android/app/`
  - **iOS**:
    - Create an iOS app in firebase console
    - Save `GoogleService-Info.plist` to `ios/` directory
- Enable `Email/password`, `Google` and `Facebook` sign-in methods in firebase console -> authentication tab.
  - To enable `Facebook` login, you would have to create a new app in facebook developer console and get the AppID and AppSecret.

**Steps I followed to create this are here: [DOCS](https://github.com/vinayakvivek/flutter-login-template/blob/master/DOCS.md)**
