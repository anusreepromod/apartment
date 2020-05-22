import 'package:new_apartment/UI/login/loginmodel.dart';

class UserSession{
 
  static final shared=UserSession._internal();
   static UserData user;

  factory UserSession(){
    
    user = UserData();

  return shared;
    
  }

  setUser(UserData data){
    user=data;
  }
  getUser(){
    return user;
  }
  UserSession._internal();
}