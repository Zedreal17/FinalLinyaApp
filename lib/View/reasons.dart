// appointment_page.dart

import 'package:flutter/material.dart';

class REASONS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: reasons(),
    );
  }
}

class reasons extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<reasons> {
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;
  bool? _isChecked4 = false;
  bool? _isChecked5 = false;
  bool? _isChecked6 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
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
                        SizedBox(width: 8.0), // Adjust the spacing as needed
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
          ],
        ),
      ),
    );
  }
}
