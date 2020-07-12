import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String text;
  // final String initialValue;
  final IconData icon;
  final TextEditingController textFieldsController = TextEditingController();
  final Function(String text) onChanged;

  ProfileCard({@required this.text, @required this.icon, this.onChanged});

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
            title: TextFormField(
              // initialValue: text,
              decoration: InputDecoration(
                          hintText: text,
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(color: Colors.grey),
                        ),
              onChanged: (value) {
                onChanged(value);
                }
            ),
          ),
        );
  }
}