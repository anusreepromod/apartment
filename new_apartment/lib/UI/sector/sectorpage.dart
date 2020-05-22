import 'package:flutter/material.dart';
import 'package:new_apartment/UI/custom/custombutton.dart';
import 'package:new_apartment/UI/registration/registrationpage.dart';
import 'package:new_apartment/UI/sector/plotmodel.dart';
import 'package:new_apartment/UI/sector/sectormodel.dart';
import 'package:new_apartment/apicall/api.dart';
import 'package:new_apartment/apicall/services.dart';



class Sectorplot extends StatefulWidget {
  @override
  _SectorplotState createState() => _SectorplotState();
}

class _SectorplotState extends State<Sectorplot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
               Padding(padding: const EdgeInsets.only(top:20.0)),
               Container(
                    child: Column(
                      children: <Widget>[
                       // Image.asset("assets/images/img.jpg",height:200,),
                        Text("Welcome",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top:40.0)),
                  sectorForm(),
                  Container(child: CircularProgressIndicator(),),
              ]
            )
                    )
        )
        
        )
      
    );
  }
Widget sectorForm(){
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(1),
        ),
               
        child: Container(
         child: Column(
         children: <Widget>[
      //    Expanded(
      //      child: DropdownButton(
      //        items: null, 
           
           
           
      //      onChanged: null)
         
         
      //    ,),
      // Expanded(
      //      child: DropdownButton(
      //        items: null, 
           
           
           
      //      onChanged: null)
         
         
      //    ,),
         SizedBox(
                  height: MediaQuery.of(context).size.height/10,
                ),
                CustomButton(
                  text: "Next",
                  color: Colors.black,
                  onPressed:(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUppage()));
                  },
                ),
         ]
                    )
        )
      )
      
      
      
      
      )
    
  );


}

// sector() async{
// final body = {
// 	"appKey": "2114328793805176159336398896909893987283958011",
//   	"appVersion": "1.0",
// 	"apiCode":"announcements_1_0",
// 	"post_data": {
// 	}
// };

// await Services.sector(body).then((results) async {
//        switch (results.status) {
//        case ServiceStatus.success:
//         final sectorResult = Sectormodel.fromJson(results.data);
        
//         print(sectorResult);
        
//         // this.setState(() { });
        
//                  break;
//        case ServiceStatus.failure:
//         print("error");
//        break;
//      }

//      });
// }
  
// //  Future <List<dynamic>> _getsector()async{
// //    final announce = await sector();
// //   return announce;

// //  }   

//  plots() async{
// final body = {
// 	"appKey": "2114328793805176159336398896909893987283958011",
//   	"appVersion": "1.0",
// 	"apiCode":"announcements_1_0",
// 	"post_data": {
// 	}
// };

// await Services.plots(body).then((results) async {
//        switch (results.status) {
//        case ServiceStatus.success:
//         final plotResult = Plotmodel.fromJson(results.data);
        
//         print(plotResult);
        
//         // this.setState(() { });
        
//                  break;
//        case ServiceStatus.failure:
//         print("error");
//        break;
//      }

//      });
// }
  
// //  Future <List<dynamic>> _getplots()async{
// //    final announce = await plots();
// //   return announce;

// //  }   
}