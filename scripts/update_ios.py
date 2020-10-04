import argparse
import xml.etree.ElementTree as ET
from shutil import copy


# constants
INFO_PLIST_FILE = 'ios/Runner/Info.plist'
XCODE_PROJECT_FILE = 'ios/Runner.xcodeproj/project.pbxproj'


def get_data_from_plist(plist_file):
    dict = ET.parse(plist_file).getroot().find('dict')
    keys = dict.iter('key')
    values = dict.iter('string')
    data = {}
    for key, value in zip(keys, values):
        data[key.text] = value.text
    return data


def update_info_plist(name, reversed_client_id, fb_app_id):
    with open(INFO_PLIST_FILE, 'r') as f:
        data = f.read()
    updated_data = data.replace('flutter_login_template', name, 1)
    updated_data = updated_data.replace(
        ("com.googleusercontent.apps"
         ".545556218005-i0jub09epdjdt7m5lj8h9qsm08sov8dj"),
        reversed_client_id, 1)
    updated_data = updated_data.replace('763344734497729', fb_app_id)
    updated_data = updated_data.replace('Flutter Login Template', name)
    with open(INFO_PLIST_FILE, 'w') as f:
        f.write(updated_data)


def update_bundle_id(bundle_id):
    with open(XCODE_PROJECT_FILE, 'r') as f:
        data = f.read()
    updated_data = data.replace('com.direvin.flutterLoginTemplate', bundle_id)
    with open(XCODE_PROJECT_FILE, 'w') as f:
        f.write(updated_data)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-n', '--name', help='Application name', metavar='N')
    parser.add_argument(
        '-f', '--google-services-file',
        help='GoogleService-Info.plist from firebase', metavar='file')
    parser.add_argument('--fb', help='Facebook AppID', metavar='id')
    args = parser.parse_args()

    name = args.name
    service_data = get_data_from_plist(args.google_services_file)
    fb_app_id = args.fb
    update_info_plist(name, service_data['REVERSED_CLIENT_ID'], fb_app_id)
    update_bundle_id(service_data['BUNDLE_ID'])

    # copy GoogleService-Info.plist
    copy(args.google_services_file, 'ios/')
