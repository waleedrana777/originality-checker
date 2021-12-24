import 'package:flutter/material.dart';

class Notfound extends StatefulWidget {
  const Notfound({Key? key}) : super(key: key);

  @override
  _NotfoundState createState() => _NotfoundState();
}

class _NotfoundState extends State<Notfound> {
  @override
  Widget build(BuildContext context) {
    //return a page not found widget with an image for product not found
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/404-error-page.png',
              height: 400,
              width: 400,
            ),
          ],
        ),
      ),
    );
  }
}
