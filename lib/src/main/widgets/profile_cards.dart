import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String text;
  final IconData icon;
  // Function onPressed;

  ProfileCard({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return   Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.blueGrey
              ),
            title: Text(
              text,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20.0,
                ),
            ),
          ),
        );
  }
}