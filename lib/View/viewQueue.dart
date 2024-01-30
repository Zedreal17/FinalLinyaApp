import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
 import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:linya/View/appointment.dart';
import 'package:linya/View/appointmentForm.dart';
import 'signUp.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class WELCOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: viewQueue(),
        
        );
        
  }
}

class viewQueue extends StatefulWidget {
  final String userName;
  final String Course;
  final int userID;
  viewQueue(
      {required this.userName, required this.userID, required this.Course});
  @override
  _MyWidgetState createState() => _MyWidgetState();
  
}

class _MyWidgetState extends State<viewQueue> {
  String data = 'Initial Data';
  
  List<dynamic> announceData = [];
  List<dynamic> appointmentData = []; // User-specific queues
  List<dynamic> appointmentData1 = []; // Ongoing queues
  @override
  void initState() {
    super.initState();
    getAnnounceData();
    getAppointmentData();
    getOnAppointmentData();
    Timer.periodic(Duration(seconds: 10), (timer) {
      // Call setState to trigger a rebuild of the widget
      setState(() {
        // You can update the data here by calling your data fetching function
        fetchData();
        getOnAppointmentData(); // Refresh ongoing queues
      getAppointmentData(); // Refresh user-specific queues
      });
    });
  }

  void fetchData() async {
    // Replace this with your actual data fetching logic
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      data = 'New Data';
    });
  }

  Future<void> getOnAppointmentData() async {
  var url = Uri.http("192.168.17.151", '/LINYA_API/getOngoingQueues.php');
  var response = await http.post(url, body: {
    'userID': widget.userID.toString(),
  });

  if (response.statusCode == 200) {
    // Extracting JSON data after the date string
    final jsonString = response.body.substring(response.body.indexOf('['));
    
    setState(() {
      appointmentData1 = json.decode(jsonString);
    });
  } else {
    // Handle the error, e.g., show an error message
    print('Error: ${response.statusCode}');
  }
}


  Future<void> getAnnounceData() async {
    var url = Uri.http("192.168.17.151", '/LINYA_API/announceList.php');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        announceData = json.decode(response.body);
      });
    } else {
      // Handle the error, e.g., show an error message
      print('Error: ${response.statusCode}');
    }
  }

  bool _isToday(String? date) {
    if (date == null) {
      return false;
    }

    DateTime appointmentDate = DateTime.parse(date);
    DateTime today = DateTime.now();

    return appointmentDate.year == today.year &&
        appointmentDate.month == today.month &&
        appointmentDate.day == today.day;
  }

  Future<void> getAppointmentData() async {
    var url = Uri.http("192.168.17.151", '/LINYA_API/appointmentList.php');
    var response = await http.post(url, body: {
      'userID': widget.userID.toString(),
    });

    if (response.statusCode == 200) {
      setState(() {
        appointmentData = json.decode(response.body);
      });
    } else {
      // Handle the error, e.g., show an error message
      print('Error: ${response.statusCode}');
    }
  }

  Future<bool> hasApprovedQueue() async {
    try {
      var url =
          Uri.http("192.168.17.151", '/LINYA_API/checkApprovedQueue.php');
      var response = await http.post(url, body: {
        'userID': widget.userID.toString(),
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['hasApprovedQueue'];
      } else {
        // Handle the error
        print('Error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
      return false;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .09,
          child: Container(
            color: const Color(0xFF213855),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/linya_logo.png',
                        height: 85,
                        width: 85,
                      ),
                    ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'NOW SERVING QUEUE',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(251, 178, 69, 1),
                      ),
                    ),
                    
                    // Filter the appointmentData based on the current date and department
                    for (int index = 0;
                        index < appointmentData1.length;
                        index++)
                      Container(
                        margin: EdgeInsets.all(0.0),
                        width: MediaQuery.of(context).size.width * .75,
                        child: Card(
                          margin: EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.all(8.0),
                                title: Container(
                                  color: Color.fromRGBO(251, 178, 69, 1),
                                  padding: EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      appointmentData1[index]
                                              ['appointment_queue'] ??
                                          'No Queue',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                subtitle: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  color: Color(0xFF213855),
                                  padding: EdgeInsets.all(15.0),
                                  child: Center(
                                    child: Text(
                                      appointmentData1[index]
                                              ['appointment_reasons'] ??
                                          'No Queue',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          'YOUR QUEUE',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromRGBO(251, 178, 69, 1),
                          ),
                        ),
                      ),
                      for (int index = 0;
                          index < appointmentData.length;
                          index++)
                        Container(
                          margin: EdgeInsets.all(0.0),
                          width: MediaQuery.of(context).size.width * .75,
                          child: Card(
                            margin: EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  title: Container(
                                    color: Color.fromRGBO(251, 178, 69, 1),
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        appointmentData[index]
                                                ['appointment_queue'] ??
                                            'No Queue',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  subtitle: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    color: Color(0xFF213855),
                                    padding: EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Text(
                                        appointmentData[index]
                                                ['appointment_reasons'] ??
                                            'No Queue',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
