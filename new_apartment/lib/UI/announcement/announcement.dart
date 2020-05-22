
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_apartment/apicall/api.dart';
import 'package:new_apartment/apicall/services.dart';
import 'announcementmodel.dart';



class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
 
      // @override
      // void initState(){
      //   super.initState();
      //   announcements();
        
      //         }
  @override
  
  Widget build(BuildContext context) {
        return Scaffold(
      body: FutureBuilder(
        builder:(context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
          return Center(
            child: Text("loading"),
          );
          break;
          case ConnectionState.active:
          if(snapshot.hasData){
            final announce =snapshot.data;
            return _getListView(announce);
          }
          break;
          default:
          Center(child: Text("loading"),);
          break;

        }

        },
        future: _getannouncement(),
        ),
           
    );
  }

  _getListView(announce){
    return ListView.builder(
      itemBuilder: (context,index){
        final announces = announce[index];
        return _getRow(announces);
      },
      itemCount: announce.length,
      );
  }
  Widget _getRow(announc){
    final title = announc["title"];
    final description = announc["description"];
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        
        children: <Widget>[
          Text("Title: $title"),
          Text("Description :$description"),
          Divider(
            color :Colors.grey,
          )

        ],)
    );
    
  }

announcements() async{
final body = {
	"appKey": "2114328793805176159336398896909893987283958011",
  	"appVersion": "1.0",
	"apiCode":"announcements_1_0",
	"post_data": {
	}
};

await Services.announcement(body).then((results) async {
       switch (results.status) {
       case ServiceStatus.success:
        final announcementResult = Announcementmodel.fromJson(results.data);
        
        print(announcementResult);
        
        // this.setState(() { });
        
                 break;
       case ServiceStatus.failure:
        print("error");
       break;
     }

     });
}
  
 Future <List<dynamic>> _getannouncement()async{
   final announce = await announcements();
  return announce;

 }   
}




