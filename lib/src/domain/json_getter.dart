import 'dart:convert';
import 'package:http/http.dart' as http;


class JsonGetterServive {

  Future<Map> getCodeByteJson() async {
    var url = Uri.https(
        'coderbyte.com', 'api/challenges/json/json-cleaning', {});

    var response = await http.get(url);
    
    return response.statusCode == 200 ? jsonDecode(response.body) : { "status": "null" };
  }

}