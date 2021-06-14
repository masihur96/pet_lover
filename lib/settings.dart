import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.green,
            )),
      ),

      body:Padding(
        padding: const EdgeInsets.only(left: 16,top: 15,right: 16),
        child: Container(
          child:ListView(
            children:[
              Text("Setting",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.blueGrey,),),
             SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color:Colors.green,
                  ),
                  SizedBox(width: 8,),
                  Text("Account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueGrey,),)
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(height: 10,),
              buildAccountOptionRow(context,"Change Password"),
              buildAccountOptionRow(context,"Social"),
              buildAccountOptionRow(context,"Language"),
              buildAccountOptionRow(context,"Privacy and security"),

              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color:Colors.green,
                  ),
                  SizedBox(width: 8,),
                  Text("Notification",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueGrey,),)
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Account Activity",style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueGrey,
                  ),),
                  Transform.scale(
                      scale: 0.7,
                      child:CupertinoSwitch(value: true,
                          onChanged:(bool val){

                          })
                      )
                ],
              ),
              SizedBox(height:20),
              Center(
                child: OutlinedButton(

                    onPressed: (){},
                    //style: null,
                    child: Text(
                      "SIGN OUT",
                      style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold,
                        letterSpacing: 2.2,
                        color:Colors.green,
                      ),
                    )),
              )
            ]
          )
        ),
      )
    );
  }
  GestureDetector buildAccountOptionRow(BuildContext context,String title)
  {
    return GestureDetector(
      onTap:(){
        showDialog(context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("OPtion 1"),
                    Text("OPtion 2"),
                    Text("OPtion 3"),

                  ],
                ),
                actions: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                    child: Text("Close"),),

                ],

              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.blueGrey,)),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }

}

