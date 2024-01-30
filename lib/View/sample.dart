// appointment_page.dart

import 'package:flutter/material.dart';

class APPOINTMENTs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: appointments(),
    );
  }
}

class appointments extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<appointments> {
  String selectedDepartment = 'Computer Studies Department';
  List<String> itemList = [
    'Computer Studies Department',
    'Electrical, Electronics, and Computer Engineering (EECE) Department',
    'Civil Engineering Department',
    'Architecture Department'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
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
    );
  }
}
