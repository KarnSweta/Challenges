a function where you pass in the object and a key and get back the value.<br />
TEST CASES:
  TEST CASE 1:
    INPUT 1:
      Object: {"a":{"b":{"c":"d"}}}
      Key: 'a'
    OUTPUT:
      {"b":{"c":"d"}}
    INPUT 2:
      Object: {"a":{"b":{"c":"d"}}}
      Key: 'b'
    OUTPUT:
      {"c":"d"}
    INPUT 3:
      Object: {"a":{"b":{"c":"d"}}}
      Key: 'c'
    OUTPUT:
      "d"
    INPUT 4"
      Object: {"a":{"b":{"c":"d"}}}
      Key: 'd'
    OUTPUT:
      "Key missing"
  TEST CASE 2:
    INPUT 1:
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}
      Key: 'x'
    OUTPUT:
      "y"
    INPUT 2:
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}
      Key: 'z'
    OUTPUT:
      {"a":{"b":{"c":"d"}}}
    INPUT 3:
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}
      Key: 'c'
    OUTPUT:
      "d"
    INPUT 4"
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}
      Key: 'f'
    OUTPUT:
      "Key missing"
      
    
