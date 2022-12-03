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
    OUTPUT:<br />
      "y"<br />
    INPUT 2:<br />
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}<br />
      Key: 'z'<br />
    OUTPUT:<br />
      {"a":{"b":{"c":"d"}}}<br />
    INPUT 3:<br />
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}<br />
      Key: 'c'<br />
    OUTPUT:<br />
      "d"<br />
    INPUT 4"<br />
      Object: {"x":"y","z":{"a":{"b":{"c":"d"}}}}<br />
      Key: 'f'<br />
    OUTPUT:<br />
      "Key missing"<br />
      
    
