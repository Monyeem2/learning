import 'package:flutter/material.dart';

class Result_page extends StatefulWidget {
  // const Result_page({super.key});

  String bmi_result;
  Result_page({required this.bmi_result});

  @override
  State<Result_page> createState() => _Result_pageState();
}

class _Result_pageState extends State<Result_page> {


  String result = '';
  String advice = '';

  late Color color;



  condition(){

    if(double.parse(widget.bmi_result) < 18){
      setState(() {
        result = 'Underweight';
        advice = 'Eat More';
        color = Colors.black;
      });
    }else if(double.parse(widget.bmi_result) >18 && double.parse(widget.bmi_result) <24){
      setState(() {
        result = 'Normal';
        advice = 'You are Fit';
        color = Colors.white;
      });
    }else{
      setState(() {
        result = 'Over Weight';
        advice = 'Eat less';
        color = Colors.red;
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    condition();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        title: Text("BMI Calculator",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:  Color(0xff527cbf),
          child: Column(
            children: [

              Text("Result",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),

              Container(
                height: 400,
                  width: 400,
                  color: Color(0xff719de3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text(result,
                      style: TextStyle(
                        fontSize: 30,
                        color: color
                      ),
                    ),

                    Text(widget.bmi_result,
                      style: TextStyle(
                          fontSize: 30,
                          color: color
                      ),

                    ),

                    Text(advice,
                      style: TextStyle(
                          fontSize: 30,
                          color: color
                      ),
                    ),
                    
                  ],
                ),
              ),
              
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Re-Calculate"),
              )

            ],
          ),
        ),
      ),

    );
  }
}
