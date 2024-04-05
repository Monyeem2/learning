import 'package:first_project/second_page.dart';
import 'package:flutter/material.dart';

class New_class extends StatefulWidget {
  const New_class({super.key});

  @override
  State<New_class> createState() => _New_classState();
}

class _New_classState extends State<New_class> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.person),
        title: Text("My profile"),
        actions: [
          Icon(Icons.notifications),
          Icon(Icons.logout)
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image(
                height: 500,
                width: 200,
                image: AssetImage("images/abc.png"),
              ),

              Text("M A Monyeem",
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              Text("Software Engineer",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20
                ),
              ),
              Text("ZenithhBD",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("Dhaka"),


              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Image_page()));


                  },
                  child: Text("2nd Page",
                    style: TextStyle(
                      color: Colors.black
                    ),
                  )
              )

            ],
          ),
        ),
      ),



    );
  }
}


