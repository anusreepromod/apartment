import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;

class API{
static Future<dynamic> post( String url,body) async{
final headers = {"Content-Type":"application/json"};
final encodeBody = JSON.jsonEncode(body);
try{
http.Response response = await http.post(url,headers:headers, body:encodeBody);
switch (response.statusCode){
  case 200:
  final jsonDecoded = JSON.jsonDecode(response.body);
  final results = Response(data:jsonDecoded,status:ServiceStatus.success );
  
  return results;
 default:
 final jsonDecoded = JSON.jsonDecode(response.body);
  final results = Response(data:jsonDecoded,status:ServiceStatus.success );
  return results;
}
}catch(error){
final results = Response(data:null,status:ServiceStatus.failure);
  return results;
}

}
}


class Response{
ServiceStatus status;
Map<String,dynamic> data;
Response({this.status,this.data});


}


 enum ServiceStatus{success,failure} 