import json
obj = {"x":{"y":{"z":"a"}},"b":{"c":{"d":"e"}}} #Enter any object of your choice
find_key = 'x' #Enter any key whose value is needed
arr = []  

def fetch_value(obj, arr, find_key):     
    if isinstance(obj, dict):            
        for key, value in obj.items():
           if key == find_key:
               arr.append(value)
           elif isinstance(value, dict):
               fetch_value(value, arr, find_key)
    return arr

if __name__ == '__main__':
    values = fetch_value(obj, arr, find_key)
    if values == []:
        print('Key missing')
    else:
        print(json.dumps(values[0]))