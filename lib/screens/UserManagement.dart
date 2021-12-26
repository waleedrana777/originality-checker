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
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200, minHeight: 100),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, signupRoute);
            },
            child: Text('Sign Up'),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200, minHeight: 100),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<OriginalityBloc>(context),
                            child: Signin(),
                          )));
            },
            child: Text('Sign In'),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200, minHeight: 100),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<OriginalityBloc>(context),
                            child: ThemeScreen(),
                          )));
            },
            child: Text('Change App Theme'),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200, minHeight: 100),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                            value: BlocProvider.of<OriginalityBloc>(context),
                            child: ChangeFontScreen(),
                          )));
            },
            child: Text('Change Font Size'),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
      ])),
    );
  }
}
