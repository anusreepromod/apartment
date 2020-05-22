import 'package:flutter/material.dart';
import 'package:new_apartment/UI/login/loginpage.dart';
import 'package:new_apartment/UI/mainpage.dart';
import '../usersession/usersession.dart';


class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final data =UserSession.shared.getUser();
    return Container(
      child: Drawer(

        child: ListView(
  
                children: <Widget>[
  
                  DrawerHeader(
  
                    decoration: BoxDecoration(
  
                        image: DecorationImage(
  
                            image: AssetImage("assets/images/build.jpg"),
  
                            fit: BoxFit.cover
  
                        )
  
                    ),
  
                  child: ListTile(
  
                          leading: Icon(Icons.account_circle),
  
                          title: Text("data.name"),
  
                          subtitle: Text("data.emailId"),
  
                        ),
  
                  ),
  
  
  
                 // ),
  
                  ListTile(
  
                    title: Text("Home"),
  
                    leading: Icon(Icons.home),
  
                    onTap: () {
  
                      Navigator.push(
  
                        context,
  
                        MaterialPageRoute(builder: (context) => Mainpage()),
  
                      );
  
                    },
  
                  ),
  
  
  
                  ListTile(
  
                    title: Text("My Profile"),
  
                    leading: Icon(Icons.account_circle),
  
                    onTap: () {
  
                      // Navigator.push(
  
                      //   context,
  
                      //   MaterialPageRoute(builder: (context) => MyProfile()),
  
                      // );
  
                    },
  
                  ),
  
  
  
                  ListTile(
  
                    title: Text("Settings"),
  
                    leading: Icon(Icons.settings),
    
                    onTap: () {
  
                      // Navigator.push(
  
                      //   context,
  
                      //   MaterialPageRoute(builder: (context) => Settings()),
  
                      // );
  
                    },
  
                  ),
  
  
  
  
  
                  ListTile(
  
                    leading: Icon(Icons.save_alt),
  
                    title: Text("Logout"),
  
                    trailing: Icon(Icons.keyboard_arrow_right),
  
               onTap: () {
  
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Loginpage()),
  
  
  
                 );
  
               },
  
                  ),
  
  
  
  
  
                ],
  
  
  
              ),


      ),
    );
  }
}