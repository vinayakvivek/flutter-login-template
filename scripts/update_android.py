from os import path, rename
import argparse
import json
from shutil import copy


def get_package_name(service_file):
    with open(service_file, 'r') as f:
        data = json.load(f)
    return data['client'][0]['client_info']['android_client_info']['package_name']


def update_package_name(file, package_name):
    try:
        with open(file, 'r') as f:
            data = f.read()
        data = data.replace('com.direvin.flutter_login_template', package_name)
        with open(file, 'w') as f:
            f.write(data)
    except FileNotFoundError:
        print('File not found: %s' % (file))


def update_files(name, package_name, fb_app_id):
    # update gradle file
    update_package_name('android/app/build.gradle', package_name)
    # update Manifest files
    update_package_name('android/app/src/profile/AndroidManifest.xml', package_name)
    update_package_name('android/app/src/main/AndroidManifest.xml', package_name)
    update_package_name('android/app/src/debug/AndroidManifest.xml', package_name)

    strings_file = 'android/app/src/main/res/values/strings.xml'
    with open(strings_file, 'r') as f:
        data = f.read()
    data = data.replace('Flutter Login Template', name)
    data = data.replace('763344734497729', fb_app_id)
    with open(strings_file, 'w') as f:
        f.write(data)

    # update MainActivity
    base = 'android/app/src/main/kotlin/com/'
    update_package_name(path.join(base, 'direvin/flutter_login_template/MainActivity.kt'), package_name)
    parts = package_name.split('.')
    try:
        rename(
            path.join(base, 'direvin/flutter_login_template'),
            path.join(base, 'direvin/' + parts[2])
        )
        rename(
            path.join(base, 'direvin'),
            path.join(base, parts[1])
        )
    except:
        print('Already renamed')


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-n', '--name', help='Application name', metavar='N')
    parser.add_argument(
        '-f', '--google-services-file',
        help='google-services.json from firebase', metavar='file')
    parser.add_argument('--fb', help='Facebook AppID', metavar='id')
    args = parser.parse_args()

    try:
        name = args.name
        package_name = get_package_name(args.google_services_file)
        fb_app_id = args.fb

        # copy google-services.json
        copy(args.google_services_file, 'android/app/')
        update_files(name, package_name, fb_app_id)
    except:
        print('Invalid inputs')
