import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/bloc/OriginalityBloc.dart';

class ChangeFontScreen extends StatefulWidget {
  const ChangeFontScreen({Key? key}) : super(key: key);

  @override
  _ChangeFontScreenState createState() => _ChangeFontScreenState();
}

class _ChangeFontScreenState extends State<ChangeFontScreen> {
  double sliderValue = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Font Size'),
        ),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text('${double.parse('$sliderValue').toInt().toString()}',
                  style: TextStyle(
                      color: Colors.black, fontSize: this.sliderValue)),
              //slider to change font size
              Slider(
                value: sliderValue,
                min: 10.0,
                max: 18.0,
                divisions: 8,
                label: 'font size',
                onChanged: (value) {
                  BlocProvider.of<OriginalityBloc>(context).add(
                    FontSizeChanged(value),
                  );
                  setState(() {
                    this.sliderValue = value;
                  });
                },
              ),
            ])));
  }
}
