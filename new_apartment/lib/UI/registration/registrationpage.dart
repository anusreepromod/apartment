

import 'package:flutter/material.dart';
import 'package:new_apartment/UI/custom/inputbox.dart';
import 'package:new_apartment/UI/login/loginpage.dart';
import 'package:new_apartment/apicall/api.dart';
import 'package:new_apartment/apicall/services.dart';




class SignUppage extends StatefulWidget {
  @override
  _SignUppageState createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  bool _isLoading = false;
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController mobileController =  TextEditingController();
  final TextEditingController nameController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.blueGrey ,
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
            gestureSection(),
          ],
        ),
      )
    );
  }

signIn(String email,pass,mobile,name) async {
      final body = {
	"appKey": "2114328793805176159336398896909893987283958011",
  	"appVersion": "1.0",
	"apiCode":"user_register_1_0",
	"post_data": {
		"sectorId":"1",
		"plotId":"3",
		"name":"Niras",
		"email":"niras@gmail.com",
		"password":"admin",
		"mobile":"8667524416",
		"regType":"tenant",
		"address":"Madurai",
"device_token":"34327knldskfjydsfl8932hf"
	}
};
     Services.dosignup(body).then((result) async {
       switch (result.status) {
       case ServiceStatus.success:
            await Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (BuildContext context) => Loginpage()), (Route<dynamic> route) => false);
         break;
       case ServiceStatus.failure:
       break;
     }
     });
    }


Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed :   ()  {
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passwordController.text,mobileController.text,nameController.text);
        },
        elevation: 0.0,
        color: Colors.purple,
        child: Text("Sign Up", style: TextStyle(color: Colors.black)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
            Inputbox(
            controller: nameController,
          valueChanged:(value)=>this._valueChange,
          type : InputType.name),
           SizedBox(height: 30.0),
            Inputbox(
            controller: emailController,
          valueChanged:(value)=>this._valueChange,
          type :InputType.email),
          SizedBox(height: 30.0),
          Inputbox(
            controller: mobileController,
          valueChanged:(value)=>this._valueChange,
          type : InputType.mobile),
            SizedBox(height: 30.0),
          Inputbox(
            controller: passwordController,
          valueChanged:(value)=>this._valueChange,
          type : InputType.password),
          SizedBox(height: 30.0),
          Inputbox(
            controller: confirmpasswordController,
          valueChanged:(value)=>this._valueChange,
          type : InputType.password),
                  ],
      ),
    );
  }
_valueChange(){

    }
  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Welcome to Visthara",
          style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
 Container gestureSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Row(
        children: <Widget>[
          Text("Already a member?"),
          GestureDetector(
                        onTap:() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Loginpage()));
                        },
                        child: Text(
                          " Click Here "),
                                             ),
                      Text("to login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black)),
        ],),
      
    );
  }
}