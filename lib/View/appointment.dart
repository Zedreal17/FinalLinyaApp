import 'dart:convert';

import 'package:http/http.dart' as http;
 import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:linya/View/appointment.dart';
import 'package:linya/View/confirmation.dart';
import 'signUp.dart';

class APPOINTMENT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: appointment(),
        );
  }
}

class appointment extends StatefulWidget {
  final String userName;
  final String Course;
  final int userID;
  appointment(
      {required this.userName, required this.userID, required this.Course});
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<appointment> {
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;
  bool? _isChecked4 = false;
  bool? _isChecked5 = false;
  bool? _isChecked6 = false;
  bool _isConsultationChecked = false;
  String selectedDepartment = 'Computer Studies Department';
  String selectedYear = '1st Year';

  List<String> yearList = ['1st Year', '2nd Year', '3rd Year', '4th Year'];
  List<String> itemList = [
    'Computer Studies Department',
    'Electrical, Electronics, and Computer Engineering (EECE) Department',
    'Civil Engineering Department',
    'Architecture Department'
  ];

  int selectedFacultyId =
      0; // Initialize with a default value or get it from the database
  List<Map<String, dynamic>> facultyList = [];
  Future<List<Map<String, dynamic>>> fetchFacultyData() async {
    // Replace this with your actual data fetching logic
    // The data should contain 'id' and 'name' fields for each faculty
    // Example: Fetch faculty data from an API

    final response = await http
        .get(Uri.parse('http://192.168.17.151/LINYA_API/fetchFaculty.php'));

    if (response.statusCode == 200) {
      final List<dynamic> facultyData = json.decode(response.body);
      return facultyData
          .map((faculty) => {'id': faculty['id'], 'name': faculty['name']})
          .toList();
    } else {
      throw Exception('Failed to load faculty data');
    }
  }

  TextEditingController reasonController = TextEditingController();
  TextEditingController facultyNameController = TextEditingController();
  TextEditingController SubjectNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'assets/1.png',
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
            height: 10,
          ),
          const Text(
            'Select Department',
            style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
                height: 2,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: DropdownButton(
              value: selectedDepartment,
              hint: const Text("Select Department"),
              isExpanded: true,
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
                  selectedDepartment = newValue as String;
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
          const SizedBox(
            height: 5,
          ),
          const Text(
            'REASONS',
            style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 0, 0),
                height: 2,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 2,
            child: Container(
              child: ListView(
                shrinkWrap:
                    true, // Ensure the ListView takes as little space as possible
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 11.0), // Adjust margin as needed
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF213855), // Set your desired background color
                      borderRadius: BorderRadius.circular(
                          10.0), // Set your desired border radius
                    ),
                    child: CheckboxListTile(
                      title: const Row(
                        children: [
                          Icon(
                            Icons.school,
                            color: Colors.white,
                          ), // Add your icon here
                          SizedBox(width: 8.0), // Adjust the spacing as needed
                          Text(
                            'ENROLLMENT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      value: _isChecked1,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked1 = newValue;
                        });
                      },
                      activeColor: Colors.amberAccent,
                      checkColor: Colors.white,
                      tileColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 11.0), // Adjust margin as needed
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF213855), // Set your desired background color
                      borderRadius: BorderRadius.circular(
                          10.0), // Set your desired border radius
                    ),
                    child: CheckboxListTile(
                      title: const Row(
                        children: [
                          Icon(
                            Icons.grading,
                            color: Colors.white,
                          ), // Add your icon here
                          SizedBox(width: 8.0), // Adjust the spacing as needed
                          Text(
                            'GRADES',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      value: _isChecked2,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked2 = newValue;
                        });
                      },
                      activeColor: Colors.amberAccent,
                      checkColor: Colors.white,
                      tileColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 11.0), // Adjust margin as needed
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF213855), // Set your desired background color
                      borderRadius: BorderRadius.circular(
                          10.0), // Set your desired border radius
                    ),
                    child: CheckboxListTile(
                      title: const Row(
                        children: [
                          Icon(
                            Icons.edit_document,
                            color: Colors.white,
                          ), // Add your icon here
                          SizedBox(width: 8.0), // Adjust the spacing as needed
                          Text(
                            'SUBMIT DOCUMENTS',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      value: _isChecked3,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked3 = newValue;
                        });
                      },
                      activeColor: Colors.amberAccent,
                      checkColor: Colors.white,
                      tileColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 11.0), // Adjust margin as needed
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF213855), // Set your desired background color
                      borderRadius: BorderRadius.circular(
                          10.0), // Set your desired border radius
                    ),
                    child: CheckboxListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.document_scanner,
                              color: Colors.white), // Add your icon here
                          SizedBox(width: 9.0), // Adjust the spacing as needed
                          Text(
                            'REQUEST DOCUMENTATION',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      value: _isChecked4,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked4 = newValue;
                        });
                      },
                      activeColor: Colors.amberAccent,
                      checkColor: Colors.white,
                      tileColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 11.0), // Adjust margin as needed
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF213855), // Set your desired background color
                      borderRadius: BorderRadius.circular(
                          10.0), // Set your desired border radius
                    ),
                    child: CheckboxListTile(
                      title: const Row(
                        children: [
                          Icon(
                            Icons.meeting_room,
                            color: Colors.white,
                          ), // Add your icon here
                          SizedBox(width: 8.0), // Adjust the spacing as needed
                          Text(
                            'CONSULTATION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      value: _isChecked5,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked1 = _isChecked2 =
                              _isChecked3 = _isChecked4 = _isChecked6 = false;
                          _isChecked5 = newValue;
                          _isConsultationChecked = newValue ?? false;
                        });
                      },
                      activeColor: Colors.amberAccent,
                      checkColor: Colors.white,
                      tileColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 11.0), // Adjust margin as needed
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF213855), // Set your desired background color
                      borderRadius: BorderRadius.circular(
                          10.0), // Set your desired border radius
                    ),
                    child: CheckboxListTile(
                      title: const Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: Colors.white,
                          ), // Add your icon here
                          SizedBox(width: 8.0), // Adjust the spacing as needed
                          Text(
                            'OTHERS',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      value: _isChecked6,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked6 = newValue;
                        });
                      },
                      activeColor: Colors.amberAccent,
                      checkColor: Colors.white,
                      tileColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ),
                  // Add more CheckboxListTile widgets as needed
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Visibility(
            visible: _isConsultationChecked,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: DropdownButton(
                    value: selectedYear,
                    hint: const Text("Select Year"),
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
                        selectedYear = newValue as String;
                      });
                    },
                    items: yearList.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: TextField(
                    controller: reasonController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set your desired border radius
                        borderSide: BorderSide.none, // Remove the border
                      ),
                      labelText: 'Reason',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: TextField(
                    controller: facultyNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set your desired border radius
                        borderSide: BorderSide.none, // Remove the border
                      ),
                      labelText: 'Faculty Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: TextField(
                    controller: SubjectNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set your desired border radius
                        borderSide: BorderSide.none, // Remove the border
                      ),
                      labelText: 'Subject Name',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 5,
            width: MediaQuery.of(context).size.width * .95,
            child: Container(
              color: Color.fromRGBO(251, 178, 69, 1),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              // Extract the selected reasons
              List<String> selectedReasons = [];
              if (_isChecked1!) selectedReasons.add('ENROLLMENT');
              if (_isChecked2!) selectedReasons.add('GRADES');
              if (_isChecked3!) selectedReasons.add('SUBMIT DOCUMENTS');
              if (_isChecked4!) selectedReasons.add('REQUEST DOCUMENTATION');
              if (_isChecked5!) selectedReasons.add('CONSULTATION');
              if (_isChecked6!) selectedReasons.add('OTHERS');

              // Navigate to the ConfirmationPage and pass the selected values
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmationPage(
                      selectedYear: selectedYear,
                      selectedDepartment: selectedDepartment,
                      selectedReasons: selectedReasons,
                      userName: widget.userName,
                      userID: widget.userID,
                      reason: reasonController.text,
                      facultyName: facultyNameController.text,
                      subjectName: SubjectNameController.text,
                      Course: widget.Course),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(251, 178, 69, 1),
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                Size(
                  MediaQuery.of(context).size.width * 0.95,
                  60.0,
                ),
              ),
            ),
            child: TextButton.icon(
              onPressed: null, // Set your onPressed logic here
              label: const Text('NEXT'),
              icon: const Icon(
                Icons.arrow_forward, // Add your desired icon
                color: Colors.white, // Set your desired icon color
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
