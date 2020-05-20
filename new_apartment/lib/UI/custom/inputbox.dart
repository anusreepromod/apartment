
import 'package:flutter/material.dart';

class Inputbox extends StatefulWidget {
  final TextEditingController controller;
  final  Function valueChanged;
  final InputType type;

  Inputbox({@required this.controller, @required this.valueChanged,this.type= InputType.email });

  @override
  _InputboxState createState() => _InputboxState();
}

class _InputboxState extends State<Inputbox> {
 String error;
  @override
  Widget build(BuildContext context) {
    return Container(
   child: TextFormField(
     onChanged: (value)=> this._valueChanged(value),
            controller: widget.controller,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
             // icon: Icon(this.widget.type._getIcon(), color: Colors.black),
              hintText: widget.type._getType(),
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black),
             errorText: this.error,
            ),
            
          ),
    );
  }

  
_valueChanged(value){
final status =this.widget.type._validation(value);
error = this.widget.type._getError(status);
 this.setState(()=>{});
}

}


enum InputType{email,password,mobile,name,username,confirmpassword}

extension _ on InputType {
  _getType(){

//return this == InputType.email ? "Email" : "Password";
 switch (this) {
   case InputType.email:
    return "Email ID";
    case InputType.username:
    return "Username";
  case InputType.password:
     return "Password";
     case InputType.confirmpassword:
     return "Confirm Password";
     case InputType.mobile:
     return "Mobile";
     case InputType.name:
     return "Your Name";
 }
  
  }


  _validation(value){
   switch (this) {
   case InputType.email:
    return 
    !RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value);
  case InputType.mobile:
     return !RegExp(r'^((\+)?(\d{2}[-]))?(\d{10}){1}?$').hasMatch(value);
     case InputType.password:
     return "password";
      case InputType.confirmpassword:
     return "Confirm Password";
     //return !RegExp(r'^([a-zA-Z0-9@*#]{8,15})$').hasMatch(value);
     case InputType.name:
     return "name";
     case InputType.username:
     return "Username";
 }
  
  }
//   _getIcon(){
//    switch (this) {
//    case InputType.email:
//     return Icons.email;
//   case InputType.password:
//      return Icons.lock;
//      case InputType.mobile:
//      return Icons.phone;
//      case InputType.name:
//      return Icons.person;
//  } 
    
//   }
  _getError(status){

 switch (this) {
   case InputType.email:
    return status ? "Email Error": "";
  case InputType.password:
     return status ? "Password Error": "";
     case InputType.confirmpassword:
     return status ? "Password Error": "";
     case InputType.mobile:
     return status ? "Mobile Error": "";
     case InputType.name:
     return status ? "Name Error": "";
     case InputType.username:
     return status ? "Username Error": "";
 }
  
  }
}