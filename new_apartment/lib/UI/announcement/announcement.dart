
import 'package:flutter/material.dart';
import 'package:new_apartment/apicall/api.dart';
import 'package:new_apartment/apicall/services.dart';
import 'announcementmodel.dart';



class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  List<dynamic>announce;
      @override
      void initState(){
        super.initState();
        announcements();
        announce=List<dynamic>();
        List value;
        announce = value;
        this.setState(() { });
      }
  @override
  
  Widget build(BuildContext context) {
        return Scaffold(
      body: Container(
        child: Container(

       

        )
      )
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

Services.announcement(body).then((results) async {
       switch (results.status) {
       case ServiceStatus.success:
        final announcementResult = Announcementmodel.fromJson(results.data);
        //print(announcementResult.result.respData);
        final value =announcementResult.result.respData;
        print(value);
        
                 break;
       case ServiceStatus.failure:
        print("error");
       break;
     }

     });
}
  
    
}




