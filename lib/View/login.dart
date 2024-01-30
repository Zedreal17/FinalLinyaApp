import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dash.dart';
import 'signUp.dart';
 import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'signUp.dart';
// import 'dash.dart';

class LOGIN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final eMail = TextEditingController();
  final pWord = TextEditingController();

  Future login() async {
    var url = Uri.http(
        "192.168.17.151", '/LINYA_API/loginStudent.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "eMail": eMail.text,
      "pWord": pWord.text,
    });
    final data = json.decode(response.body);

    if (data['status'] == 'success') {
      // Save user login info using shared preferences
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //prefs.setString('eMail', eMail.text);

      //Fluttertoast.showToast(msg: 'Welcome, ${data['userName']}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Welcome(
                userName: data['userName'],
                userID: data['userID'],
                Course: data['Course'])),
      );

      print('Login successful');
    } else {
      // Handle login failure
      print('Login failed: ${data['message']}');
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
                  height: 300,
                  width: 400,
                ),
                const Text(
                  'WELCOME BACK STUDENT',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Login now',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromRGBO(251, 178, 69, 1),
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 50),
                const Text(
                  'E-email',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    height: 2,
                  ),
                  textAlign: TextAlign.left,
                ),
                TextField(
  controller: eMail,
  style: TextStyle(
    color: Colors.white,
  ),
  decoration: InputDecoration(
    hintText: 'e-mail',
    hintStyle: TextStyle(
      fontSize: 12.0,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(251, 178, 69, 1)),
    ),
  ),
),

                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    height: 2,
                  ),
                  textAlign: TextAlign.left,
                ),
                TextField(
  controller: pWord,
  obscureText: true,
  style: TextStyle(
    color: Colors.white,
  ),
  decoration: InputDecoration(
    hintText: 'password',
    hintStyle: TextStyle(
      fontSize: 12.0,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(251, 178, 69, 1)),
    ),
  ),
),

        const SizedBox(height: 50.0),
            ElevatedButton(
  onPressed: () {
    login();
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromRGBO(251, 178, 69, 1), // Set the background color of the button to white
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Adjust the radius of the corners as needed
      ),
    ),
    fixedSize: MaterialStateProperty.all<Size>(
      const Size(500.0, 40.0),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      Colors.white ?? Colors.black, // Set text color to light grey or a default color
    ),
  ),
  child: Text('Login'),
),
SizedBox(height: 16),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => signUp()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromRGBO(251, 178, 69, 1), // Set the background color of the button to white
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Adjust the radius of the corners as needed
      ),
    ),
    fixedSize: MaterialStateProperty.all<Size>(
      const Size(500.0, 40.0),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      Colors.white ?? Colors.black, // Set text color to light grey or a default color
    ),
  ),
  child: Text('Create Account'),
),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
