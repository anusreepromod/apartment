

import 'api.dart';

class Services{
 
static Future<Response> doLogin(body) async{
  final url = "http://saitechnologies.xyz/web/vis/app_control2";
  
 Response response = await API.post(url,body);
 
 print (response);
 return response;
  }

  static Future<Response> dosignup(body) async{
  final url = "http://visthara.techtist.com/app_control";
  
 Response response = await API.post(url,body);
 
 print (response);
 return response;
  }


  static Future<Response> feedback(body) async{
  final url = "http://visthara.techtist.com/app_control";
  
 Response response = await API.post(url,body);
 
 print (response);
 return response;
  }



  static Future<Response> announcement(body) async{
  final url = "http://visthara.techtist.com/app_control";
  
  
 Response response = await API.post(url,body);
   print (response);
 return response;
  }
}

  





