import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:linya/View/dash.dart';
import 'package:linya/View/reasons.dart';

class ConfirmationPage extends StatefulWidget {
  final String selectedDepartment;
  final String facultyName;
  final List<String> selectedReasons;
  final String userName;
  final String Course;
  final String selectedYear;
  final String reason;
  final String subjectName;
  final int userID;
  ConfirmationPage(
      {required this.selectedDepartment,
      required this.selectedReasons,
      required this.userName,
      required this.userID,
      required this.Course,
      required this.selectedYear,
      required this.reason,
      required this.facultyName, 
      required this.subjectName,
      });

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  String timeSelection = '8:00AM - 12:00PM';
  List<String> itemList = ['8:00AM - 12:00PM', '1:00PM - 5:00PM'];

  TextEditingController sDepartment = TextEditingController();
  TextEditingController sReason = TextEditingController();
  TextEditingController sName = TextEditingController();
  TextEditingController sCourse = TextEditingController();
  TextEditingController dateAppointment = TextEditingController();
  TextEditingController sAppointment = TextEditingController();
  TextEditingController student_year = TextEditingController();
  TextEditingController natureCounselling = TextEditingController();
  TextEditingController teacherInvolved = TextEditingController();
  TextEditingController SubjectInvolved = TextEditingController();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String reasonsText = widget.selectedReasons.join(', ');
    sDepartment = TextEditingController(text: widget.selectedDepartment);
    sReason = TextEditingController(text: reasonsText);
    sName = TextEditingController(text: widget.userID.toString());
    sCourse = TextEditingController(text: widget.Course);

    student_year = TextEditingController(text: widget.selectedYear);
    natureCounselling = TextEditingController(text: widget.reason);
    teacherInvolved = TextEditingController(text: widget.facultyName);
    SubjectInvolved = TextEditingController(text: widget.subjectName);
    dateAppointment = TextEditingController(
        text: '${dateTime.year}/${dateTime.month}/${dateTime.day}');

    Future<void> addAppointment() async {
      var url =
          Uri.parse("http://192.168.17.151/LINYA_API/addAppointment.php");
      var response = await http.post(url, body: {
        "sDepartment": sDepartment.text,
        "sName": sName.text,
        "sCourse": sCourse.text,
        "dateAppointment": dateAppointment.text,
        "sAppointment": timeSelection,
        "sReason": sReason.text,
        "student_year": student_year.text,
        "natureCounselling": natureCounselling.text,
        "teacherInvolved": teacherInvolved.text,
        "subjectInvolved": SubjectInvolved.text,
      });

      var dataInsert = json.decode(response.body);

      if (dataInsert == "ERROR") {
        //Fluttertoast.showToast(msg: 'ERROR SAVING THE APPOINTMENT');
      } else if (dataInsert == "SUCCESS") {
        // Appointment saved successfully, navigate to home
        //Fluttertoast.showToast(msg: 'Appointment saved successfully');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Welcome(
              userName: widget.userName,
              userID: widget.userID,
              Course: widget.Course,
            ),
          ),
        );
      } else {
        // Handle unexpected response
        print("Unexpected response: $dataInsert");
      }
    }

    return Scaffold(
      body: SingleChildScrollView(child:Column(children: [
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
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .09,
          width: MediaQuery.of(context).size.width * .95,
          child: Column(
            children: [
              Image.asset(
                'assets/2.png',
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .95,
              ),
            ],
          ),
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
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(10.0), // Set your desired border radius
            border: Border.all(
              color: Colors.black, // Set your desired border color
              width: 2.0, // Set your desired border width
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: false, // Set this to false to hide the widget
              child: Text(
                widget.userID.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const Text(
              'Department Selected',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.right,
            ),
            TextField(
              controller: sDepartment,
              enabled: false, // Set to false to make it not editable
              textAlign: TextAlign.center, // Set the text alignment
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400 // Set the font size
                  ),
            ),
            SizedBox(
              height: 5,
              width: MediaQuery.of(context).size.width * .7,
              child: Container(
                color: const Color.fromRGBO(251, 178, 69, 1),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Reasons',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.7, // Set your desired width
              margin: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: sReason,
                enabled: false,
                textAlign: TextAlign.start,
                maxLines: null,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(
                      255, 255, 255, 255), // Set your desired text color
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF213855),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set your desired border radius
                    borderSide: BorderSide.none, // Remove the border
                  ),
                ),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(10.0), // Set your desired border radius
            border: Border.all(
              color: Colors.black, // Set your desired border color
              width: 2.0, // Set your desired border width
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Set Schedule',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.right,
            ),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        initialDateTime: dateTime,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() => dateTime = newTime);
                        },
                        use24hFormat: false,
                        mode: CupertinoDatePickerMode.date,
                      )),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(251, 178, 69, 1),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(
                    MediaQuery.of(context).size.width * 0.7,
                    60.0,
                  ),
                ),
              ),
              child: const Text('SELECT SCHEDULE'),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.7, // Set your desired width
              margin: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: dateAppointment,
                enabled: false,
                textAlign: TextAlign.start,
                maxLines: null,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(
                      255, 255, 255, 255), // Set your desired text color
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF213855),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set your desired border radius
                    borderSide: BorderSide.none, // Remove the border
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
              width: MediaQuery.of(context).size.width * .7,
              child: Container(
                color: const Color.fromRGBO(251, 178, 69, 1),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'SELECT TIME',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin:
                  const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownButton(
                value: timeSelection,
                hint: const Text("Select Department"),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                underline: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onChanged: (newValue) {
                  setState(() {
                    timeSelection = newValue as String;
                  });
                },
                items: itemList.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 5,
          width: MediaQuery.of(context).size.width * .9,
          child: Container(
            color: const Color.fromRGBO(251, 178, 69, 1),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {
            addAppointment();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(251, 178, 69, 1),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(
                MediaQuery.of(context).size.width * 0.7,
                60.0,
              ),
            ),
          ),
          child: const Text('Set Appointment'),
        ),
      ]),
      ),
    );
  }
}
