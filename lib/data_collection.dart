import 'package:first_project/result_page.dart';
import 'package:flutter/material.dart';


class Data_collection extends StatefulWidget {
  const Data_collection({super.key});

  @override
  State<Data_collection> createState() => _Data_collectionState();
}

class _Data_collectionState extends State<Data_collection> {

  double height = 0.0;

  int weight = 70;
  int age = 20;

  double bmi = 0.0;


  bmi_calculation(){

    setState(() {

      bmi = (weight / (height * height));
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        title: Center(
          child: Text("BMI Calculator",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          color:  Color(0xff527cbf),
          child: Column(
            children: [


              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      color: Color(0xff719de3),
                      height: 200,
                      width: 170,
                      child: Column(
                        children: [

                          Icon(Icons.male,
                            color: Colors.white,
                            size: 130,
                          ),

                          Text("Male",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30
                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      color: Color(0xff719de3),
                      height: 200,
                      width: 170,
                      child: Column(
                        children: [

                          Icon(Icons.female,
                            color: Colors.white,
                            size: 130,
                          ),

                          Text("Female",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30
                            ),
                          )

                        ],
                      ),
                    ),
                  )

                ],
              ),

              SizedBox(height: 20,),

              Container(
                height: 200,
                width: 370,
                color: Color(0xff719de3),
                child: Column(
                  children: [

                    Text("Height",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                      ),
                    ),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "Height",
                        // hintText: "Height"
                      ),
                     keyboardType: TextInputType.number,
                     onChanged: (input){
                        height = double.parse(input);
                     },

                    ),
                  ],
                ),

              ),

              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 200,
                      width: 170,
                      color: Color(0xff719de3),
                      child: Column(
                        children: [

                          Text("Weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30
                            ),
                          ),

                          Text(weight.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30
                            ),
                          ),

                          Row(
                            children: [

                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icon(Icons.add,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                              ),

                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icon(Icons.exposure_minus_1,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 200,
                      width: 170,
                      color: Color(0xff719de3),
                      child: Column(
                        children: [

                          Text("Age",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30
                            ),
                          ),

                          Text(age.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30
                            ),
                          ),

                          Row(
                            children: [

                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icon(Icons.add,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),

                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icon(Icons.exposure_minus_1,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  )

                ],
              ),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                  onPressed: (){
                    bmi_calculation();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Result_page(bmi_result: bmi.toString(),)));


                  },
                  child: Text("Calculate"),
              )


            ],
          ),
        ),
      ),

    );
  }
}
