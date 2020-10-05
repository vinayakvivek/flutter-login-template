# git reset --hard
# git clean -f -d

AME=$1
FB_ID=$4
python3 scripts/update_android.py -n "$NAME" -f "$2" --fb $FB_ID
python3 scripts/update_ios.py -n "$NAME" -f "$3" --fb $FB_ID

# get main packages
flutter pub get

# get packaged in auth repo
cd packages/authentication_repository
flutter pub get

