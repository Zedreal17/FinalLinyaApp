import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:linya/View/login.dart';

import 'appointment.dart';
import 'confirmCancel.dart';
import 'viewProfile.dart';
import 'viewQueue.dart';

class WELCOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: Welcome(),
        );
  }
}

class Welcome extends StatefulWidget {
  final String userName;
  final String Course;
  final int userID;
  Welcome({required this.userName, required this.userID, required this.Course});
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Welcome> {
  List<dynamic> announceData = [];
  List<dynamic> appointmentData = [];

  @override
  void initState() {
    super.initState();
    getAnnounceData();
    getAppointmentData();
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

  Future<void> cancelAppointment(int id) async {
    try {
      var url =
          Uri.http("192.168.17.151", '/LINYA_API/cancelAppointment.php');
      var response = await http.post(url, body: {
        'id': id.toString(),
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          // Appointment cancelled successfully
          // Fluttertoast.showToast(msg: 'Appointment cancelled successfully');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ConfirmCancel(
                userName: widget.userName,
                userID: widget.userID,
                Course: widget.Course,
              ),
            ),
          );
        } else {
          // Failed to cancel appointment
          //Fluttertoast.showToast(msg: 'Failed to cancel appointment');
        }
      } else {
        // Handle the error
        print('Error: ${response.statusCode}');
        //Fluttertoast.showToast(msg: 'Failed to cancel appointment');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
      //Fluttertoast.showToast(msg: 'Failed to cancel appointment');
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

  Future<bool> hasPendingRequest() async {
    // Implement the logic to check if the user has a pending request
    // You may need to create a new PHP file or modify an existing one for this check
    // Update the URL accordingly
    var url =
        Uri.http("192.168.17.151", '/LINYA_API/checkPendingRequest.php');
    var response = await http.post(url, body: {
      'userID': widget.userID.toString(),
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['hasPendingRequest'];
    } else {
      // Handle the error
      print('Error: ${response.statusCode}');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable back button
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Welcome(
                                          userName: widget.userName,
                                          userID: widget.userID,
                                          Course: widget.Course,
                                        )),
                              );
                            },
                            child: Image.asset(
                              'assets/linya_logo.png',
                              height: 85,
                              width: 85,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => viewData()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF213855),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(
                                  MediaQuery.of(context).size.width * 0.01,
                                  MediaQuery.of(context).size.height * 0.05,
                                ),
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person, // Add your desired user icon
                                  color: Colors.white,
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
              height: 20,
            ),
            // SizedBox(
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 20.0),
            //     child: Row(
            //       children: [
            //         Text(
            //           'WELCOME ${widget.userName}',
            //           style: TextStyle(
            //             fontSize: 20.0,
            //             color: Color.fromRGBO(251, 178, 69, 1),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                        FutureBuilder<bool>(
                          future: hasApprovedQueue(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // If the future is still running, show a loading indicator
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // If there was an error with the future, show an error message
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // If the future completed successfully, use the result to show the card or button
                              final hasApproved = snapshot.data ?? false;

                              return hasApproved
                                  ? YourCardWidget(
                                      appointmentData: appointmentData ?? [],
                                      userName: widget.userName,
                                      userID: widget.userID,
                                      Course: widget.Course,
                                      onCancelAppointment: cancelAppointment,
                                    )
                                  : FutureBuilder<bool>(
                                      future: hasPendingRequest(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          // If the future is still running, show a loading indicator
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          // If there was an error with the future, show an error message
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          // If the future completed successfully, use the result to show the card or button
                                          final hasPending =
                                              snapshot.data ?? false;

                                          return hasPending
                                              ? YourPendingCardWidget()
                                              : ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            appointment(
                                                          userName:
                                                              widget.userName,
                                                          userID: widget.userID,
                                                          Course: widget.Course,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                      Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                    ),
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all<Size>(
                                                      Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.95,
                                                        200.0,
                                                      ),
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        side: const BorderSide(
                                                          color: Color.fromRGBO(
                                                              44, 62, 80, 1),
                                                          width: 3.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'CLICK HERE TO GET STARTED',
                                                      style: TextStyle(
                                                        fontSize: 40.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF213855),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                );
                                        }
                                      },
                                    );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 5,
              width: MediaQuery.of(context).size.width * .95,
              child: Container(
                color: Color.fromRGBO(251, 178, 69, 1),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'ANNOUNCEMENT',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(251, 178, 69, 1),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width * .95,
              child: ListView.builder(
                  itemCount: announceData.length,
                  itemBuilder: (BuildContext context, int index) {
                    var reversedIndex = announceData.length - 1 - index; // Reverse the index
                    var data = announceData[reversedIndex]; // Get the reversed data

    return Card(
      color: Color(0xFF213855),
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          width: 2.0,
        ),
      ),
      child: ListTile(
  contentPadding: const EdgeInsets.all(8.0),
  title: Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Text(
      data['user_name'],
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  subtitle: Text(
    data['announcement_details'],
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
  ),
  // trailing: Text(
  //   data['created_at'],
  //   style: const TextStyle(
  //     color: Colors.white,
  //     fontSize: 14.0,
  //   ),
  // ),
),

    );
  },
),
            ),
          ]),
        ),
      ),
    );
  }
}

class YourCardWidget extends StatelessWidget {
  final List<dynamic> appointmentData;
  final String userName;
  final int userID;
  final String Course;
  final Function(int) onCancelAppointment;

  YourCardWidget({
    required this.appointmentData,
    required this.userName,
    required this.userID,
    required this.Course,
    required this.onCancelAppointment,
  });
  @override
  Widget build(BuildContext context) {
    // Implement the UI for the card here
    return Column(
      children: [
        for (int index = 0; index < appointmentData.length; index++)
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
                          appointmentData[index]['appointment_queue'] ??
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
                      height: MediaQuery.of(context).size.height * .1,
                      color: Color(0xFF213855),
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          appointmentData[index]['appointment_reasons'] ??
                              'No Queue',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_isToday(appointmentData[index]['date_appointment']))
                    Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.height * .55,
                      color: Color.fromARGB(0, 33, 56, 85),
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(251, 178, 69, 1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => viewQueue(
                                userName: userName,
                                userID: userID,
                                Course: Course,
                              ),
                            ),
                          );
                        },
                        child: Text('View QUEUE'),
                      ),
                    ),
                  if (_isFutureDate(appointmentData[index]['date_appointment']))
                    Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.height * .55,
                      color: Color.fromARGB(0, 33, 56, 85),
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors
                                .red, // Change the color according to your preference
                          ),
                        ),
                        onPressed: () {
                          // Pass the appointment ID to the cancelAppointment method
                          onCancelAppointment(appointmentData[index]['id']);
                        },
                        child: Text('Cancel Appointment'),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
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

  bool _isFutureDate(String? date) {
    if (date == null) {
      return false;
    }

    DateTime appointmentDate = DateTime.parse(date);
    DateTime today = DateTime.now();

    return appointmentDate.isAfter(today);
  }
}

class YourPendingCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the UI for the pending card here
    return Container(
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
                child: const Center(
                  child: Text(
                    'Your Request is Pending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              subtitle: Container(
                height: MediaQuery.of(context).size.height * .1,
                color: Color(0xFF213855),
                padding: EdgeInsets.all(15.0),
                child: const Center(
                  child: Text(
                    'Waiting for approval...',
                    style: TextStyle(
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
    );
  }
}
