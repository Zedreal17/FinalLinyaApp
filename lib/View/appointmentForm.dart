import 'dart:convert';

import 'package:http/http.dart' as http;
 import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:linya/View/appointment.dart';
import 'package:linya/View/confirmation.dart';
import 'package:linya/View/reasons.dart';
import 'package:linya/View/review.dart';
import 'package:linya/View/sample.dart';
import 'signUp.dart';

class APPOINTMENT1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: appointment1(),
    );
  }
}

class appointment1 extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<appointment1> {
  int _currentStep = 0;
  String timeSelection = '8:00AM - 12:00PM';
  List<String> times = ['8:00AM - 12:00PM', '1:00PM - 5:00PM'];

  

  String selectedDepartment = 'Computer Studies Department';
  List<String> selectedReasons = [];
  List<String> itemList = [
    'Computer Studies Department',
    'Electrical, Electronics, and Computer Engineering (EECE) Department',
    'Civil Engineering Department',
    'Architecture Department'
  ];
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;
  bool? _isChecked4 = false;
  bool? _isChecked5 = false;
  bool? _isChecked6 = false;
  TextEditingController sDepartment = TextEditingController();
  TextEditingController sReason = TextEditingController();
  TextEditingController dateAppointment = TextEditingController();
  TextEditingController sAppointment = TextEditingController();
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    //sDepartment = TextEditingController(text: widget.selectedDepartment);
    List<Step> steps() => [
          Step(
            title: Text(''),
            content: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Department',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                      height: 2,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: DropdownButton(
                      value: selectedDepartment,
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
                ],
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          ),
          Step(
            title: Text(''),
            content: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    width: MediaQuery.of(context).size.width * .8,
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
                                  SizedBox(
                                      width:
                                          8.0), // Adjust the spacing as needed
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
                                  SizedBox(
                                      width:
                                          8.0), // Adjust the spacing as needed
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
                                  SizedBox(
                                      width:
                                          8.0), // Adjust the spacing as needed
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
                                      color:
                                          Colors.white), // Add your icon here
                                  SizedBox(
                                      width:
                                          8.0), // Adjust the spacing as needed
                                  Text(
                                    'REQUEST DOCUMENTATION',
                                    style: TextStyle(color: Colors.white),
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
                                  SizedBox(
                                      width:
                                          8.0), // Adjust the spacing as needed
                                  Text(
                                    'CONSULTATION',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              value: _isChecked5,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _isChecked5 = newValue;
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
                                  SizedBox(
                                      width:
                                          8.0), // Adjust the spacing as needed
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
                ],
              ),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep <= 1 ? StepState.editing : StepState.complete,
          ),
          Step(
            title: Text(''),
            content: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Department Selected',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    // Display selected department in a TextField
                    TextField(
                      controller: sDepartment,
                      enabled: false,
                      textAlign: TextAlign.center,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
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
                    // Display selected reasons in a TextField
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: TextField(
                        controller: sReason,
                        enabled: false,
                        textAlign: TextAlign.start,
                        maxLines: null,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF213855),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isActive: _currentStep >= 2,
            state: _currentStep == 2 ? StepState.editing : StepState.complete,
          ),
        ];
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
          height: MediaQuery.of(context).size.height * .05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        const EdgeInsets.all(9.0), // Adjust margin as needed
                    child: Image.asset(
                      'assets/back.png',
                      height: 25,
                      width: 25,
                    ),
                  )),
                ],
              ),
              const Column(
                children: [
                  Text(
                    'CREATE AN APPOINTMENT',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        height: 2,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .55,
          width: MediaQuery.of(context).size.width * .95,
          child: Container(
            child: Stepper(
              steps: steps(),
              type: StepperType.horizontal,
              currentStep: _currentStep,
              onStepContinue: () {
                setState(() {
                  if (_currentStep < steps().length - 1) {
                    _currentStep += 1;
                  } else {
                    print('Stepper completed');
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep -= 1;
                  } else {
                    // Navigate to the previous screen or perform any other action
                    print('Stepper canceled');
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}
