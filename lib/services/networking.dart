import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper {
  var url;
  NetworkHelper(this.url);

  Future getDataFromNet() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;

      return jsonDecode(data);
    }else {
      print( 'Error Status Code is ========> ' + response.statusCode.toString());
    }
  }
}