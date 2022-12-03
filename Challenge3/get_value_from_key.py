import json
#Enter any object of your choice
object = {"x":{"y":{"z":"a"}}}
#Enter the key whose value you need to find out
find_key = 'y'

def mapnew(object, find_key): 
    fetched_value = {}
    if isinstance(object,dict):
        for key, value in object.items():            
            if key == find_key:               
                fetched_value = json.dumps(value)
                return fetched_value
        return mapnew(value, find_key)
    else:
        return 'key missing'
        
if __name__ == '__main__':
    if object:
        key_value = mapnew(object, find_key)
        print(key_value)
    else:
        print('The object passed is empty')
