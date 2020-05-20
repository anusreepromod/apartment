

import 'package:flutter/material.dart';
import 'package:new_apartment/UI/custom/custombutton.dart';
import 'package:new_apartment/apicall/api.dart';
import 'package:new_apartment/apicall/services.dart';

import '../mainpage.dart';

class Feedbacks extends StatefulWidget {
  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  bool _isLoading = false;

   TextEditingController titleController =  TextEditingController();

   TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    //loader = false;
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    
  }

  @override

  Widget build(BuildContext context) {

 return Stack(
   children: [
     Container(
       decoration: BoxDecoration(
         color: Colors.transparent,
         border: new Border.all(color: Colors.transparent),
         image: DecorationImage(
           image: new AssetImage("assets/images/build.png"),fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter, // <-- BACKGROUND IMAGE
         ),
       ),
     ),

   Scaffold(
      //home: Scaffold(
        backgroundColor: Colors.white60,
          drawer: Drawer(),
          appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Feedback"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
         child:Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top:70.0)),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                      labelText: 'Title',
                      hintText: 'Title',
                    ),
                    autofocus: false,
                  ),
              //),
              SizedBox(
                height: MediaQuery.of(context).size.height/30,
              ),
                TextFormField(
                  controller: descriptionController,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                   maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Comments',
                    hintText: 'Comments',
                    contentPadding: new EdgeInsets.symmetric(vertical:40.0, horizontal: 10.0,),
                  ),
                  autofocus: false,
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height/30,
              ),
              CustomButton(
                text: "Submit",
                color: Colors.blueAccent,
               onPressed :   ()  {
          setState(() {
            _isLoading = true;
          });
          feedbacks(titleController.text, descriptionController.text);
        },
              ),
            ],
          ),
        ),
        ),
        ),
        )
     ),
    ],
    );
  }

  feedbacks(String title,description) async {
     final body = {
	"appKey": "2114328793805176159336398896909893987283958011",
  	"appVersion": "1.0",
	"apiCode":"announcements_1_0",
	"post_data": {
		"regId":"1", //from the user_data regId.
		"title":title,
		"description":description
	}
};
     Services.feedback(body).then((result) async {
       switch (result.status) {
       case ServiceStatus.success:
            await Navigator.of(context).push(
           MaterialPageRoute(builder: (BuildContext context) => Mainpage()));
         break;
       case ServiceStatus.failure:
       break;
     }
     });
 }
}