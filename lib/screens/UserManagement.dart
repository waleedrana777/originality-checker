import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/router/constants.dart';
import 'package:originalitygram/screens/ChangeFontScreen.dart';
import 'package:originalitygram/screens/Signin.dart';
import 'package:originalitygram/screens/Signup.dart';
import 'package:originalitygram/screens/ThemeScreen.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        actions: [
          //Button with moon icon to change theme
          IconButton(
            icon: Icon(Icons.brightness_3),
            onPressed: () {
              BlocProvider.of<OriginalityBloc>(context).add(ThemeChanged());
            },
          ),
        ],
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 300, maxHeight: 100, minWidth: 300, minHeight: 100),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              Navigator.pushNamed(context, signupRoute);
            },
            child: Row(children: [
              Icon(Icons.person_add, size: 50),
              SizedBox(width: 20),
              Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold))
            ]),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 300, maxHeight: 100, minWidth: 300, minHeight: 100),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<OriginalityBloc>(context),
                            child: Signin(),
                          )));
            },
            child: Row(children: [
              Icon(Icons.lock_open, size: 50),
              SizedBox(width: 20),
              Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold))
            ]),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 300, maxHeight: 100, minWidth: 300, minHeight: 100),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<OriginalityBloc>(context),
                            child: ThemeScreen(),
                          )));
            },
            child: Row(children: [
              Icon(Icons.palette, size: 50),
              SizedBox(width: 20),
              Text('Change App Theme',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ]),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 300, maxHeight: 100, minWidth: 300, minHeight: 100),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<OriginalityBloc>(context),
                            child: ChangeFontScreen(),
                          )));
            },
            child: Row(children: [
              Icon(Icons.font_download, size: 50),
              SizedBox(width: 20),
              Text('Change Font Size',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ]),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
      ])),
    );
  }
}
