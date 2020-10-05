NAME=$1
FB_ID=$4
echo "Your App name: $1"
echo "Your Facebook AppID: $4"
echo "Updating android files ..."
python3 scripts/update_android.py -n "$NAME" -f "$2" --fb $FB_ID
echo "Updating ios files ..."
python3 scripts/update_ios.py -n "$NAME" -f "$3" --fb $FB_ID

echo "Fetching flutter packages ..."
# get main packages
flutter pub get

# get packaged in auth repo
cd packages/authentication_repository
flutter pub get
echo "Done."
