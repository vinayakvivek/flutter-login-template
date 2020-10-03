## Steps I followed while creating this
- Create flutter app
  ```bash
  flutter create --org "com.direvin" flutter_login_template
  ```
- Create package `authentication_repository`
  - Make dirs `packages/authentication_repository/`
  - Add a `pubspec.yaml`, with required dependencies
  - Create user model, auth methods
- Create a Firebase project in [firebase console](https://console.firebase.google.com/)
  - Add an android app (click on android button)
    - Register app
      - Android package name: `com.direvin.flutter_login_template`
      - App nickname: `Flutter Login Template`
      - Get SHA1 of certificate, [[source]](https://developers.google.com/android/guides/client-auth)
        ```
        keytool -list -v \
          -alias androiddebugkey -keystore ~/.android/debug.keystore
        ```
        note: password is empty for this keystore
    - Download the `google-services.json` file
      - save to `android/app/`
    - Follow steps in firebase
      - Add `google-services` dependency in project level `build.gradle` file.
        ```
        classpath 'com.google.gms:google-services:4.3.4'
        ```
      - Add `google-services` plugin in app level gradle file
        ```
        apply plugin: 'com.google.gms.google-services'
        ```
  - Add an iOS app
    - Register app
      - iOS bundleID: `com.direvin.flutterLoginTemplate`
        [search for `PRODUCT_BUNDLE_IDENTIFIER` in `Runner.xcodeproj/project.pbxproj`]
        [[help]](https://stackoverflow.com/a/55128145/13793292)
      - App nickname: `Flutter Login Template`
    - Add the config file to the xcode project
      - Right-click on Runner -> Add files -> Select `GoogleService-Info.plist` (copy if required on)
    - Check out [this](https://github.com/FirebaseExtended/flutterfire/issues/2751): *Couldn't find `ios/Podfile`*
      - Do `pod init` to create a Podfile