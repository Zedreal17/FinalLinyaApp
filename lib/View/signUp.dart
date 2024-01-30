import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:fluttertoast/fluttertoast.dart';


class signUP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: signUp(),
    );
  }
}

class signUp extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<signUp> {
  String selectedDepartment = 'Computer Studies Department';
  String selectedCourse = 'BSIT'; // Added variable to store selected course
  List<String> itemList = [
    'Computer Studies Department',
    'Electrical, Electronics, and Computer Engineering (EECE) Department',
    'Civil Engineering Department',
    'Architecture Department'
  ];

  TextEditingController studentID = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController pNumber = TextEditingController();
  TextEditingController eMail = TextEditingController();
  TextEditingController pWord = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController course = TextEditingController();

    bool isButtonDisabled = false; // Added variable to track button state


  Future addStudent() async {
  // Validation checks
  if (studentID.text.isEmpty ||
      fname.text.isEmpty ||
      lname.text.isEmpty ||
      pNumber.text.isEmpty ||
      eMail.text.isEmpty ||
      pWord.text.isEmpty ||
      !RegExp(r'^[0-9]+$').hasMatch(studentID.text) ||
      RegExp(r'\d').hasMatch(fname.text) ||
      RegExp(r'\d').hasMatch(lname.text) ||
      !eMail.text.contains('@')) {
    // Show toast message for validation error
    Fluttertoast.showToast(
      msg: "Error: Check if all Inputs are Valid",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    return;
  }

  var url = Uri.parse("http://192.168.17.151/LINYA_API/addStudent.php");
  var response = await http.post(url, body: {
    "studentID": studentID.text,
    "fname": fname.text,
    "lname": lname.text,
    "pNumber": pNumber.text,
    "eMail": eMail.text,
    "pWord": pWord.text,
    "department": selectedDepartment,
    "course": course.text,
  });

  print("Response Status Code: ${response.statusCode}");
  print("Response Body: ${response.body}");

  if (response.statusCode == 200) {
    // Data successfully pushed to the database
    // Show toast message for successful account creation
    Fluttertoast.showToast(
      msg: "Account has been created",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Disable the button after successful account creation
    setState(() {
      isButtonDisabled = true;
    });

    // Navigate to the login screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  } else {
    // Handle server-side error case
    Fluttertoast.showToast(
      msg: "Error: Server-side error occurred",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF213855),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/linya_logo.png',
                  height: 200,
                  width: 200,
                ),
                const Text(
                  'STUDENT SIGN UP',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right,
                ),
                const Text(
                  'PLEASE ENTER YOUR CREDENTIALS',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color.fromRGBO(251, 178, 69, 1),
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 50),
                TextField(
                  controller: studentID,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Student ID (Optional)',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    labelText: 'Student ID',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: fname,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(255, 255, 255, 0.498),
                    ),
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: lname,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: pNumber,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: eMail,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: pWord,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Student Department",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
   Container(
  padding: const EdgeInsets.only(left: 8, right: 16),
  decoration: BoxDecoration(
    color: Colors.white, // Set the background color of the entire container to white
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0),   // Adjust the radius of each corner as needed
      topRight: Radius.circular(8.0),
      bottomLeft: Radius.circular(8.0),
      bottomRight: Radius.circular(8.0),
    ),
  ),
  child: DropdownButton(
    value: selectedDepartment,
    hint: Text(
      "Select Department",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    isExpanded: true,
    icon: Icon(
      Icons.arrow_drop_down_outlined,
      color: Colors.black, // Set the color of the dropdown icon to black
    ),
    style: TextStyle(
      color: Colors.black, // Set the text color of the selected item to black
    ),
    underline: Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: Colors.black, // Set the color of the underline to black
    ),
    onChanged: (newValue) {
      setState(() {
        selectedDepartment = newValue as String;
      });
    },
    items: itemList.map((valueItem) {
      return DropdownMenuItem(
        value: valueItem,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set background color of the dropdown item to white
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),   // Adjust the radius of each corner as needed
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
          ),
          child: Text(
            valueItem,
            style: TextStyle(
              color: Colors.black, // Set text color of the dropdown item to black
            ),
          ),
        ),
      );
    }).toList(),
  ),
),

    SizedBox(height: 10),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Student Course",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
  padding: const EdgeInsets.only(left: 8, right: 16),
  decoration: BoxDecoration(
    color: Colors.white, // Set the background color of the entire container to white
    borderRadius: BorderRadius.circular(8.0), // Adjust the radius of the corners as needed
  ),
  child: DropdownButton<String>(
    value: selectedCourse,
    onChanged: (String? newValue) {
      setState(() {
        selectedCourse = newValue!;
        // Assuming there is a TextEditingController named 'course'
        // Update the text when the course is changed
        course.text = selectedCourse;
      });
    },
    items: <String>[
      'BSIT', 'BSCS', 'BSEE', 'BSCE', 'BSARCHI', 'BSCOMENG', 'BSLIS'
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set background color of the dropdown item to white
            borderRadius: BorderRadius.circular(8.0), // Adjust the radius of the corners as needed
          ),
          child: Text(value),
        ),
      );
    }).toList(),
  ),
),

      ],
    ),
  ],
),

                

                SizedBox(height: 30),
                ElevatedButton(
  onPressed: () {
    // Add your login logic here
    addStudent();
  }, 
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromRGBO(251, 178, 69, 1),
    ),
    fixedSize: MaterialStateProperty.all<Size>(
      const Size(500.0, 40.0),
    ),
  ),
  child: const Text(
    'Create Account',
    style: TextStyle(
      color: Colors.white, // Set text color to white
    ),
  ),
),
SizedBox(height: 10),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromRGBO(251, 178, 69, 1),
    ),
    fixedSize: MaterialStateProperty.all<Size>(
      const Size(500.0, 40.0),
    ),
  ),
  child: const Text(
    'Login',
    style: TextStyle(
      color: Colors.white, // Set text color to white
    ),
  ),
),

SizedBox(height: 10),
                TextField(
  controller: course,
  style: TextStyle(
    color: Colors.transparent, // Set text color to transparent
  ),
  enabled: false, // Disabled text field
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent), // Transparent border
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent), // Transparent border when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent), // Transparent border when focused
    ),
    hintText: '', // Empty hint text
    hintStyle: TextStyle(
      fontSize: 0.0, // Set font size to 0 for invisible hint text
      color: Colors.transparent, // Transparent hint text color
    ),
    labelText: '', // Empty label text
    labelStyle: TextStyle(
      color: Colors.transparent, // Transparent label text color
    ),
    focusColor: Colors.transparent, // Transparent focus color
    hoverColor: Colors.transparent, // Transparent hover color
  ),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
