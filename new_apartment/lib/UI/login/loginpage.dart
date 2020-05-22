


import 'package:flutter/material.dart';
import 'package:new_apartment/UI/custom/custombutton.dart';
import 'package:new_apartment/UI/custom/inputbox.dart';
import 'package:new_apartment/UI/registration/registrationpage.dart';
import 'package:new_apartment/UI/sector/sectorpage.dart';
import 'package:new_apartment/apicall/api.dart';
import 'package:new_apartment/apicall/services.dart';

import '../mainpage.dart';
import '../usersession/usersession.dart';
import 'loginmodel.dart';


class Loginpage extends StatefulWidget {
 @override
 
    _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  
  TextEditingController mobileController, passwordController;
  bool _autoValid = false;
  bool loader = false;
  bool _isLoading = false;
  final _loginForm = GlobalKey<FormState>();

  String email;
   @override
  void initState() {
    loader = false;
    super.initState();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    
  }
  @override

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: new Border.all(color: Colors.transparent),
            image: DecorationImage(
              image: new AssetImage("assets/images/build.png"),fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter, // <-- BACKGROUND IMAGE
            ),
          ),
        ),

      Scaffold(
        backgroundColor:Colors.transparent,
        body: SafeArea(child: Builder(
          builder: (context) {
            return Stack(
              children: <Widget>[
                loginForm(context),
                loader ? CircularProgressIndicator() : Container(),

              ],
            );
          },
        )),
      ),
      ],
    );
  }

  logIn(String mobile,pass) async {
     final body = {
	"appKey": "2114328793805176159336398896909893987283958011",
  	"appVersion": "1.0",
	"apiCode":"login_1_0",
	"post_data": {
		"email":"email",    //either using mail id or mobile no.
		"mobile":mobile,	//doesnt need to send mobile/email field all the time
		"password":pass, 
    "device_token":"34327knldskfjydsfl8932hf"
  }
	};
     Services.doLogin(body).then((results) async {
       switch (results.status) {
       case ServiceStatus.success:
        final loginResult = Loginsuccessmodel.fromJson(results.data);
        UserSession.shared.setUser(loginResult.result.respData.userData);
        if (loginResult.result.apistatus == "success"){
         await Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (BuildContext context) => Mainpage()), (Route<dynamic> route) => false);      
        }else{
         _showAlert(context, "Error", loginResult.result.respData.message);
        }
                 break;
       case ServiceStatus.failure:
        _showAlert(context, "Error", "Error");
       break;
     }

     });
    }
   _showAlert(BuildContext context, title,msg){
   setState(() {
            _isLoading = false;
          });
    showDialog(
      context: context,
      builder:(context)=> AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          Text("Cancel"),
        ],
      ));
  }
   Widget loginForm(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: _loginForm,
          autovalidate: _autoValid,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                                Padding(padding:EdgeInsets.only(top:20)),
              Text("Explore the possibilities in a",style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white,fontSize:20),),
                Text("Connected Community",style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white,fontSize:20 ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height/40,
                ),
                    Inputbox(
                controller: mobileController,
          valueChanged:(value)=>this._valueChange,
          type :InputType.mobile,
                              ),
               SizedBox(
                  height: MediaQuery.of(context).size.height/40,
                ),     
                Inputbox(
            controller: passwordController,
          valueChanged:(value)=>this._valueChange,
          type : InputType.password),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                CustomButton(
                  text: "Login",
                  color: Colors.blueAccent,
                  onPressed:(){
          //           setState(() {
          //   _isLoading = true;
          // });
          //              logIn(mobileController.text, passwordController.text);
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mainpage()),
                );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                CustomButton(
                  text: "Create Account",
                  color: Colors.black,
                  onPressed:(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sectorplot()));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                Container(
                 width: MediaQuery.of(context).size.width,
      height: 30.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 10.0,left: 15.0),
      child: GestureDetector(
        child: Text("Forgot Password?",textAlign: TextAlign.right,style: TextStyle(decoration: TextDecoration.none, color: Colors.black)),
           onTap: () {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SignUppage()), (Route<dynamic> route) => false);
  }
      )

                ),

              ],
            ),
          ),
        ));
  }
  _valueChange(){

    }

  @override
  void dispose() {
    
    super.dispose();
    
    mobileController.dispose();
    
    passwordController.dispose();
  }
      
   
  }
