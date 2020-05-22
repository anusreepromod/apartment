import 'package:flutter/material.dart';


import 'announcement/announcement.dart';
import 'drawer/drawer.dart';
import 'feedback/feedback.dart';




class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> with SingleTickerProviderStateMixin
   {

  TabController _tabController;

  @override
  void initState() {
  _tabController = new TabController(length: 3, vsync:this);
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawers(),
    appBar: AppBar(
       backgroundColor: Colors.black12,
       title: Text("Visthara Community"),
      ),

         body: Container(
           child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                  Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                        child:GestureDetector(
                          child: Card(

                            child:Column(

                              children: <Widget>[
                                Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                // Image.asset(
                                //   "assets/images/address-book96.png",height:70.0,
                                //   fit: BoxFit.scaleDown,
                                // ),
                                Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                Text("Address Book")
                              ],
                            ),

                          ),
                          onTap:() {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => AddressBook()));
                           },

                        ),
                      ),

                      Expanded(
                          flex:1,
                          child:GestureDetector(
                            //color: Colors.white38,
                            child:Card(
                              child: Column(
                                children: <Widget>[
                                  Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                  // Image.asset(
                                  //   "assets/images/services96.png",height: 70.0,

                                  // ),
                                  Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                  Text("Services")
                                ],
                              ),
                            ),
                            onTap:() {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => Services()));
                            },

                          ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,

                        child:GestureDetector(

                          child: Card(
                            child:Column(
                              children: <Widget>[
                                Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                // Image.asset(
                                //   "assets/images/annoucement96.png",height:70.0,
                                //   fit: BoxFit.none,
                                // ),
                                Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                Text("Annoucement")
                              ],
                            ),

                          ),
                          onTap:() {
                            
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Announcement()));
                          },

                        ),
                      ),

                      Expanded(
                        flex:1,
                        child:GestureDetector(
                          //color: Colors.white38,
                          child:Card(
                            //elevation: 5.0,
                            child: Column(
                              children: <Widget>[
                                Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                // Image.asset(
                                //   "assets/images/feedback96.png",height:70.0,

                                // ),
                                Padding(padding: const EdgeInsets.only(left:15.0,right:15.0,top:10.0)),
                                Text("Feedback")
                              ],
                            ),
                          ),
                          onTap:() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Feedbacks()));
                          },

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
         ),
),

    );
  }
}
