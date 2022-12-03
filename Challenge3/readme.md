a function where you pass in the object and a key and get back the value.<br />
TEST CASES:<br />
  TEST CASE 1:<br />
    INPUT 1:<br />
      Object: {"a":{"b":{"c":"d"}}}<br />
      Key: 'a'<br />
    OUTPUT:<br />
      {"b":{"c":"d"}}<br />
    INPUT 2:<br />
      Object: {"a":{"b":{"c":"d"}}}<br />
      Key: 'b'<br />
    OUTPUT:<br />
      {"c":"d"}<br />
    INPUT 3:<br />
      Object: {"a":{"b":{"c":"d"}}}<br />
      Key: 'c'<br />
    OUTPUT:<br />
      "d"<br />
    INPUT 4"<br />
      Object: {"a":{"b":{"c":"d"}}}<br />
      Key: 'd'<br />
    OUTPUT:<br />
      "Key missing"<br />
  TEST CASE 2:<br />
    INPUT 1:<br />
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}<br />
      Key: 'x'<br />
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
      
    
