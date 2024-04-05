import 'dart:convert';

import 'package:first_project/model/loan_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'bar_chart.dart';
import 'fl_chart.dart';
import 'model/barchart/collection_barchart.dart';
import 'model/barchart/dc_barchart.dart';
import 'model/barchart/mr_barchart.dart';
import 'model/barchart/so_barchart.dart';
import 'model/dashboard.dart';

class Design_Dashboard extends StatefulWidget {
  const Design_Dashboard({super.key});

  @override
  State<Design_Dashboard> createState() => _Design_DashboardState();
}

class _Design_DashboardState extends State<Design_Dashboard> {
  // final List<BarChartGroupData> _barChartData = [
  //   BarChartGroupData(
  //     x: 0,
  //     barRods: [
  //       BarChartRodData(toY: 5000),
  //       BarChartRodData(toY: 3000),
  //     ],
  //   ),
  //   BarChartGroupData(
  //     x: 1,
  //     barRods: [
  //       BarChartRodData(toY: 6000),
  //       BarChartRodData(toY: 2000),
  //     ],
  //   ),
  //   BarChartGroupData(
  //     x: 2,
  //     barRods: [
  //       BarChartRodData(toY: 7000),
  //       BarChartRodData(toY: 1000),
  //     ],
  //   ),
  // ];

  late AllDashboard allDashboard;
  late LoanModel loanModel;
  String collection = '0.0';
  String MR = '0.0';
  String SO = '0.0';
  String DC = '0.0';
  String loan = '0.0';

  get_all_dashboard_Data() async {
    final response = await http.get(Uri.parse(
        "http://103.150.48.70:6116/GAZI/management_dashboard/alldashboard.php"));

    print(response.body);

    allDashboard = allDashboardFromJson(response.body);

    setState(() {
      collection = allDashboard.xCollection;
      MR = allDashboard.xDeposit;
      SO = allDashboard.xOrder;
      DC = allDashboard.xDelivery;
    });

    final response_loan = await http.get(Uri.parse(
        "http://103.150.48.70:6116/GAZI/management_dashboard/loan.php"));

    print(response_loan.body);

    loanModel = loanModelFromJson(response_loan.body);

    setState(() {
      loan = loanModel.loan;
    });
  }

  List<dynamic> data_loan_details = [];

  Future<void> loan_details_fetchData() async {
    final response = await http.get(Uri.parse(
        'http://103.150.48.70:6116/GAZI/management_dashboard/loan_business.php')); // Replace YOUR_API_URL_HERE with your actual API endpoint

    print(response.body);

    if (response.statusCode == 200) {
      // If the request is successful
      setState(() {
        // Update the state with the fetched data
        data_loan_details = jsonDecode(response.body);
      });
    } else {
      // If the request fails, you can handle the error accordingly
      print('Failed to load data: ${response.statusCode}');
    }
  }

  List<dynamic> data_collection_details = [];

  Future<void> collection_details_fetchData() async {
    final response = await http.get(Uri.parse(
        'http://103.150.48.70:6116/GAZI/management_dashboard/collection_business.php')); // Replace YOUR_API_URL_HERE with your actual API endpoint

    print(response.body);

    if (response.statusCode == 200) {
      // If the request is successful
      setState(() {
        // Update the state with the fetched data
        data_collection_details = jsonDecode(response.body);
      });
    } else {
      // If the request fails, you can handle the error accordingly
      print('Failed to load data: ${response.statusCode}');
    }
  }

  List<dynamic> data_mr_details = [];

  Future<void> mr_details_fetchData() async {
    final response = await http.get(Uri.parse(
        'http://103.150.48.70:6116/GAZI/management_dashboard/mr_business.php')); // Replace YOUR_API_URL_HERE with your actual API endpoint

    print(response.body);

    if (response.statusCode == 200) {
      // If the request is successful
      setState(() {
        // Update the state with the fetched data
        data_mr_details = jsonDecode(response.body);
      });
    } else {
      // If the request fails, you can handle the error accordingly
      print('Failed to load data: ${response.statusCode}');
    }
  }

  List<dynamic> data_so_details = [];

  Future<void> so_details_fetchData() async {
    final response = await http.get(Uri.parse(
        'http://103.150.48.70:6116/GAZI/management_dashboard/so_business.php')); // Replace YOUR_API_URL_HERE with your actual API endpoint

    print(response.body);

    if (response.statusCode == 200) {
      // If the request is successful
      setState(() {
        // Update the state with the fetched data
        data_so_details = jsonDecode(response.body);
      });
    } else {
      // If the request fails, you can handle the error accordingly
      print('Failed to load data: ${response.statusCode}');
    }
  }

  List<dynamic> data_DC_details = [];

  Future<void> dc_details_fetchData() async {
    final response = await http.get(Uri.parse(
        'http://103.150.48.70:6116/GAZI/management_dashboard/dc_business.php')); // Replace YOUR_API_URL_HERE with your actual API endpoint

    print(response.body);

    if (response.statusCode == 200) {
      // If the request is successful
      setState(() {
        // Update the state with the fetched data
        data_DC_details = jsonDecode(response.body);
      });
    } else {
      // If the request fails, you can handle the error accordingly
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_all_dashboard_Data();
    loan_details_fetchData();
    collection_details_fetchData();
    mr_details_fetchData();
    so_details_fetchData();
    so_details_fetchData();
    dc_details_fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("DashBoard"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Details'),
                            content: Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: Text(
                                      'Business Name',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    TableCell(
                                        child: Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign
                                          .right, // Align the text to the right
                                    )),
                                  ],
                                ),
                                // Populate the table dynamically
                                for (var item in data_collection_details)
                                  TableRow(
                                    children: [
                                      TableCell(child: Text(item['zorg'])),
                                      // TableCell(child: Text(("${NumberFormat('#,##,###').format(double.parse(item['XCollection']).toStringAsFixed(2))}"))),

                                      TableCell(
                                        child: Text(
                                          NumberFormat('#,##,###').format(
                                              double.parse(
                                                  item['XCollection'])),
                                          textAlign: TextAlign
                                              .right, // Align the text to the right
                                        ),
                                      ),
                                    ],
                                  ),

                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Business Name')),
                                //     TableCell(child: Text('Amount')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Pipe')),
                                //     TableCell(child: Text('10,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Sink')),
                                //     TableCell(child: Text('20,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Door')),
                                //     TableCell(child: Text('30,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Tank')),
                                //     TableCell(child: Text('40,000')),
                                //   ],
                                // ),

                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 170,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/collection.png',
                                height: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '৳ ${NumberFormat('#,##,###').format(double.parse(collection))}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Collection',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Details'),
                            content: Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: Text(
                                      'Business Name',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    TableCell(
                                        child: Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign
                                          .right, // Align the text to the right
                                    )),
                                  ],
                                ),
                                // Populate the table dynamically
                                for (var item in data_mr_details)
                                  TableRow(
                                    children: [
                                      TableCell(child: Text(item['zorg'])),
                                      TableCell(
                                        child: Text(
                                          NumberFormat('#,##,###').format(
                                              double.parse(item['XDeposit'])),
                                          textAlign: TextAlign
                                              .right, // Align the text to the right
                                        ),
                                      ),
                                      // TableCell(child: Text(("${NumberFormat('#,##,###').format(double.parse(item['XDeposit']).toStringAsFixed(2))}"))),
                                    ],
                                  ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Business Name')),
                                //     TableCell(child: Text('Amount')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Pipe')),
                                //     TableCell(child: Text('10,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Sink')),
                                //     TableCell(child: Text('20,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Door')),
                                //     TableCell(child: Text('30,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Tank')),
                                //     TableCell(child: Text('40,000')),
                                //   ],
                                // ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 170,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/mr.png',
                                height: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '৳ ${NumberFormat('#,##,###').format(double.parse(MR))}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'MR',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Details'),
                            content: Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: Text(
                                      'Business Name',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    TableCell(
                                        child: Text(
                                      'Amount',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight
                                              .bold), // Align the text to the right
                                    )),
                                  ],
                                ),
                                // Populate the table dynamically
                                for (var item in data_so_details)
                                  TableRow(
                                    children: [
                                      TableCell(child: Text(item['zorg'])),
                                      TableCell(
                                        child: Text(
                                          NumberFormat('#,##,###').format(
                                              double.parse(item['XOrder'])),
                                          textAlign: TextAlign
                                              .right, // Align the text to the right
                                        ),
                                      ),
                                      // TableCell(child: Text(("${NumberFormat('#,##,###').format(double.parse(item['XOrder']).toStringAsFixed(2))}"))),
                                    ],
                                  ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Business Name')),
                                //     TableCell(child: Text('Amount')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Pipe')),
                                //     TableCell(child: Text('10,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Sink')),
                                //     TableCell(child: Text('20,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Door')),
                                //     TableCell(child: Text('30,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Tank')),
                                //     TableCell(child: Text('40,000')),
                                //   ],
                                // ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width: 170,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/so.png',
                                height: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '৳ ${NumberFormat('#,##,###').format(double.parse(SO))}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              Text(
                                'Sales Order',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Details'),
                            content: Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                        child: Text(
                                      'Business Name',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    TableCell(
                                        child: Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign
                                          .right, // Align the text to the right
                                    )),
                                  ],
                                ),
                                // Populate the table dynamically
                                for (var item in data_DC_details)
                                  TableRow(
                                    children: [
                                      TableCell(child: Text(item['zorg'])),
                                      TableCell(
                                        child: Text(
                                          NumberFormat('#,##,###').format(
                                              double.parse(item['XDelivery'])),
                                          textAlign: TextAlign
                                              .right, // Align the text to the right
                                        ),
                                      ),
                                      // TableCell(child: Text(("${NumberFormat('#,##,###').format(double.parse(item['XDelivery']).toStringAsFixed(2))}"))),
                                    ],
                                  ),

                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Business Name')),
                                //     TableCell(child: Text('Amount')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Pipe')),
                                //     TableCell(child: Text('10,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Sink')),
                                //     TableCell(child: Text('20,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Door')),
                                //     TableCell(child: Text('30,000')),
                                //   ],
                                // ),
                                // TableRow(
                                //   children: [
                                //     TableCell(child: Text('Gazi Tank')),
                                //     TableCell(child: Text('40,000')),
                                //   ],
                                // ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width: 170,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/dc.png',
                                height: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '৳ ${NumberFormat('#,##,###').format(double.parse(DC))}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              Text(
                                'Delivery Challan',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),





                      // Container(
                      //   width: 170,
                      //   height: 150,
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       begin: Alignment.topLeft,
                      //       end: Alignment.bottomRight,
                      //       colors: [
                      //         Colors.blue,
                      //         Colors.green,
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.circular(20),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.5),
                      //         spreadRadius: 5,
                      //         blurRadius: 7,
                      //         offset:
                      //             Offset(0, 3), // changes position of shadow
                      //       ),
                      //     ],
                      //   ),
                      //   child: Center(
                      //     child: Container(
                      //       width: 150,
                      //       child: Text(
                      //         'DC\n${NumberFormat('#,##,###').format(double.parse(DC))} BDT',
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Details'),
                        content: Table(
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                    child: Text(
                                  'Business Name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                                TableCell(
                                    child: Text(
                                  'Amount',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign
                                      .right, // Align the text to the right
                                )),
                              ],
                            ),
                            // Populate the table dynamically
                            for (var item in data_loan_details)
                              TableRow(
                                children: [
                                  TableCell(child: Text(item['zorg'])),
                                  // TableCell(child: Text((-1.0 * double.parse(item['loan'])).toStringAsFixed(2))),
                                  TableCell(
                                    child: Text(
                                      NumberFormat('#,##,###').format(
                                          -1.0 * double.parse(item['loan'])),
                                      textAlign: TextAlign
                                          .right, // Align the text to the right
                                    ),
                                  ),
                                  // TableCell(child: Text(("${NumberFormat('#,##,###').format((-1.0 * double.parse(item['loan'])).toStringAsFixed(2))}"))),
                                ],
                              ),

                            // TableRow(
                            //   children: [
                            //     TableCell(child: Text('Business Name')),
                            //     TableCell(child: Text('Amount')),
                            //   ],
                            // ),
                            // TableRow(
                            //   children: [
                            //     TableCell(child: Text('Gazi Pipe')),
                            //     TableCell(child: Text('10,000')),
                            //   ],
                            // ),
                            // TableRow(
                            //   children: [
                            //     TableCell(child: Text('Gazi Sink')),
                            //     TableCell(child: Text('20,000')),
                            //   ],
                            // ),
                            // TableRow(
                            //   children: [
                            //     TableCell(child: Text('Gazi Door')),
                            //     TableCell(child: Text('30,000')),
                            //   ],
                            // ),
                            // TableRow(
                            //   children: [
                            //     TableCell(child: Text('Gazi Tank')),
                            //     TableCell(child: Text('40,000')),
                            //   ],
                            // ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      width: 360,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/loan.png',
                            height: 50,
                          ),
                          SizedBox(height: 10),
                          Text(
                            '৳ ${NumberFormat('#,##,###').format(-1.0 * double.parse(loan))}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          Text(
                            'Loan',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),



                  // Container(
                  //   width: 360,
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //       colors: [
                  //         Colors.blue,
                  //         Colors.green,
                  //       ],
                  //     ),
                  //     borderRadius: BorderRadius.circular(20),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.5),
                  //         spreadRadius: 5,
                  //         blurRadius: 7,
                  //         offset: Offset(0, 3), // changes position of shadow
                  //       ),
                  //     ],
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       'Loan\n${(-1.0 * double.parse(loan)).toStringAsFixed(2)} BDT',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),

              Collection_BarChart(),

              SizedBox(height: 10),

              MR_BarChart(),

              SizedBox(height: 10),

              SO_BarChart(),

              SizedBox(height: 10),

              DC_BarChart(),

              SizedBox(height: 10),

              // BarChartSample2(feature_name: "Collection for \nthe Last Three Months",),
              // // Text(
              // //   'Collection for the Last Three Months',
              // //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // // ),
              // // SizedBox(height: 10),
              // // AspectRatio(
              // //   aspectRatio: 1.7,
              // //   child: BarChart(
              // //     BarChartData(
              // //       groupsSpace: 20,
              // //       barTouchData: BarTouchData(
              // //         enabled: false,
              // //         touchTooltipData: BarTouchTooltipData(
              // //           tooltipBgColor: Colors.transparent,
              // //         ),
              // //       ),
              // //       titlesData: FlTitlesData(
              // //         show: true,
              // //         bottomTitles: AxisTitles(
              // //           // showTitles: true,
              // //           // textStyle: TextStyle(color: Colors.black),
              // //           // margin: 10,
              // //           // getTitles: (double value) {
              // //           //   switch (value.toInt()) {
              // //           //     case 0:
              // //           //       return 'Month 1';
              // //           //     case 1:
              // //           //       return 'Month 2';
              // //           //     case 2:
              // //           //       return 'Month 3';
              // //           //     default:
              // //           //       return '';
              // //           //   }
              // //           // },
              // //         ),
              // //       ),
              // //       borderData: FlBorderData(
              // //         show: true,
              // //         border: Border.all(
              // //           color: Colors.black,
              // //           width: 1,
              // //         ),
              // //       ),
              // //       barGroups: _barChartData,
              // //     ),
              // //   ),
              // // ),
              // SizedBox(height: 10),
              //
              // SizedBox(height: 10),
              // BarChartSample2(feature_name: "MR for the Last Three Months",),
              // // Text(
              // //   'MR for the Last Three Months',
              // //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // // ),
              // // SizedBox(height: 10),
              // // AspectRatio(
              // //   aspectRatio: 1.7,
              // //   child: BarChart(
              // //     BarChartData(
              // //       groupsSpace: 20,
              // //       barTouchData: BarTouchData(
              // //         enabled: false,
              // //         touchTooltipData: BarTouchTooltipData(
              // //           tooltipBgColor: Colors.transparent,
              // //         ),
              // //       ),
              // //       titlesData: FlTitlesData(
              // //         show: true,
              // //         bottomTitles: AxisTitles(
              // //           // showTitles: true,
              // //           // textStyle: TextStyle(color: Colors.black),
              // //           // margin: 10,
              // //           // getTitles: (double value) {
              // //           //   switch (value.toInt()) {
              // //           //     case 0:
              // //           //       return 'Month 1';
              // //           //     case 1:
              // //           //       return 'Month 2';
              // //           //     case 2:
              // //           //       return 'Month 3';
              // //           //     default:
              // //           //       return '';
              // //           //   }
              // //           // },
              // //         ),
              // //       ),
              // //       borderData: FlBorderData(
              // //         show: true,
              // //         border: Border.all(
              // //           color: Colors.black,
              // //           width: 1,
              // //         ),
              // //       ),
              // //       barGroups: _barChartData,
              // //     ),
              // //   ),
              // // ),
              // SizedBox(height: 10),
              //
              // SizedBox(height: 10),
              //
              // BarChartSample2(feature_name: "SO for the Last Three Months",),
              // // Text(
              // //   'SO for the Last Three Months',
              // //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // // ),
              // // SizedBox(height: 10),
              // // AspectRatio(
              // //   aspectRatio: 1.7,
              // //   child: BarChart(
              // //     BarChartData(
              // //       groupsSpace: 20,
              // //       barTouchData: BarTouchData(
              // //         enabled: false,
              // //         touchTooltipData: BarTouchTooltipData(
              // //           tooltipBgColor: Colors.transparent,
              // //         ),
              // //       ),
              // //       titlesData: FlTitlesData(
              // //         show: true,
              // //         bottomTitles: AxisTitles(
              // //           // showTitles: true,
              // //           // textStyle: TextStyle(color: Colors.black),
              // //           // margin: 10,
              // //           // getTitles: (double value) {
              // //           //   switch (value.toInt()) {
              // //           //     case 0:
              // //           //       return 'Month 1';
              // //           //     case 1:
              // //           //       return 'Month 2';
              // //           //     case 2:
              // //           //       return 'Month 3';
              // //           //     default:
              // //           //       return '';
              // //           //   }
              // //           // },
              // //         ),
              // //       ),
              // //       borderData: FlBorderData(
              // //         show: true,
              // //         border: Border.all(
              // //           color: Colors.black,
              // //           width: 1,
              // //         ),
              // //       ),
              // //       barGroups: _barChartData,
              // //     ),
              // //   ),
              // // ),
              // SizedBox(height: 10),
              //
              // SizedBox(height: 10),
              //
              // BarChartSample2(feature_name: "DC for the Last Three Months",),
              // //
              // // Text(
              // //   'DC for the Last Three Months',
              // //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // // ),
              // // SizedBox(height: 10),
              // // AspectRatio(
              // //   aspectRatio: 1.7,
              // //   child: BarChart(
              // //     BarChartData(
              // //       groupsSpace: 20,
              // //       barTouchData: BarTouchData(
              // //         enabled: false,
              // //         touchTooltipData: BarTouchTooltipData(
              // //           tooltipBgColor: Colors.transparent,
              // //         ),
              // //       ),
              // //       titlesData: FlTitlesData(
              // //         show: true,
              // //         bottomTitles: AxisTitles(
              // //           // showTitles: true,
              // //           // textStyle: TextStyle(color: Colors.black),
              // //           // margin: 10,
              // //           // getTitles: (double value) {
              // //           //   switch (value.toInt()) {
              // //           //     case 0:
              // //           //       return 'Month 1';
              // //           //     case 1:
              // //           //       return 'Month 2';
              // //           //     case 2:
              // //           //       return 'Month 3';
              // //           //     default:
              // //           //       return '';
              // //           //   }
              // //           // },
              // //         ),
              // //       ),
              // //       borderData: FlBorderData(
              // //         show: true,
              // //         border: Border.all(
              // //           color: Colors.black,
              // //           width: 1,
              // //         ),
              // //       ),
              // //       barGroups: _barChartData,
              // //     ),
              // //   ),
              // // ),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
