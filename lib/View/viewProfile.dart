import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:linya/View/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signUp.dart';
import 'dash.dart';

class LOGIN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: viewData(),
    );
  }
}

class viewData extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
Future<void> _logout() async {
    // Clear user data from SharedPreferences or perform other logout tasks
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); // Clear all data, adjust based on your needs
  }
class _LoginScreenState extends State<viewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF213855),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
            // Call the logout function
            await _logout();

            // Navigate to the login screen
            Navigator.pushReplacementNamed(context, '/View/login');
          },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(251, 178, 69, 1),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                        const Size(500.0, 40.0)),
                  ),
                  child: const Text('LOGOUT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
