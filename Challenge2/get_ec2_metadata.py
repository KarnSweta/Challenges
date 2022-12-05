import requests
import json
arr = []
metadata_url = 'http://169.254.169.254/latest/'

def fetch_value(obj, arr, find_key):
    if isinstance(obj, dict):
        for key, value in obj.items():
           if key == find_key:
               arr.append(value)
           elif isinstance(value, dict):
               fetch_value(value, arr, find_key)
    return arr

def get_metadata(url, arr):
    output = {}
    for item in arr:
        new_url = url + item
        r = requests.get(new_url)
        text = r.text
        if item[-1] == "/":
            list_of_values = r.text.splitlines()
            output[item[:-1]] = get_metadata(new_url, list_of_values)
        elif is_json(text):
            output[item] = json.loads(text)
        else:
            output[item] = text
    return output


def get_json():
    sub_url = ["meta-data/"]
    metadata = get_metadata(metadata_url, sub_url)
    metadata_json = json.dumps(metadata, indent=4, sort_keys=True)
    return metadata_json

def is_json(myjson):
    try:
        json.loads(myjson)
    except ValueError:
        return False
    return True

if __name__ == '__main__':
    obj = get_json()
    print (obj)
    find_key = input("Enter the key:")
    objnew = json.loads(obj)
    values = fetch_value(objnew, arr, find_key)
    print("value is --------------------------------------------------------------")
    print(json.dumps(values[0]))