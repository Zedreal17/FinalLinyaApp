import 'package:flutter/material.dart';
import 'package:linya/View/dash.dart';

class ConfirmCancel extends StatefulWidget {
  final String userName;
  final String Course;

  final int userID;
  ConfirmCancel({
    required this.userName,
    required this.userID,
    required this.Course,
  });

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmCancel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Cancellation'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Cancellation Complete',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to dash.dart
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Welcome(
                          userName: widget.userName,
                          userID: widget.userID,
                          Course: widget.Course,
                        ),
                      ),
                    );
                  },
                  child: Text('Go to Dash'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
