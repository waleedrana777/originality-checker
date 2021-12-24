import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/bloc/OriginalityBloc.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        //A button that changes the theme of the app
        body: Center(
            child: ElevatedButton(
          child: Text('Toggle Theme Between Light and Dark Mode'),
          onPressed: () {
            BlocProvider.of<OriginalityBloc>(context).add(ThemeChanged());
          },
        )));
  }
}
