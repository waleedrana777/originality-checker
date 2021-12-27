import 'package:flutter/material.dart';

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  //controller for the feedback text field
  final TextEditingController _feedbackController = TextEditingController();

  String radio_value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feedback'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Feedback Form',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Choose the type of feedback',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                //radio buttons to choose the type of feedback like comments, suggestions, questions, issues
                RadioListTile(
                  title: Text('Comments'),
                  toggleable: true,
                  selected: radio_value == "Comments" ? true : false,
                  value: radio_value,
                  groupValue: 'Comments',
                  onChanged: (value) {
                    setState(() {
                      radio_value = 'Comments';
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Suggestions'),
                  toggleable: true,
                  selected: radio_value == "Suggestions" ? true : false,
                  value: radio_value,
                  groupValue: 'Suggestions',
                  onChanged: (value) {
                    setState(() {
                      radio_value = 'Suggestions';
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Questions'),
                  toggleable: true,
                  selected: radio_value == "Questions" ? true : false,
                  value: radio_value,
                  groupValue: 'Questions',
                  onChanged: (value) {
                    setState(() {
                      radio_value = 'Questions';
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Issues'),
                  toggleable: true,
                  selected: radio_value == "Issues" ? true : false,
                  value: radio_value,
                  groupValue: 'Issues',
                  onChanged: (value) {
                    setState(() {
                      radio_value = 'Issues';
                    });
                  },
                ),

                //an input form with heading "Describe your feedback" and a text field to enter the feedback. A submit button and  a cancel button will be there.
                Padding(padding: EdgeInsets.all(10)),
                Text('Describe your feedback',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(10)),
                Expanded(
                  child: TextField(
                    controller: _feedbackController,
                    decoration: InputDecoration(
                      hintText: 'Enter your feedback here',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        //show a snackbar that says "Feedback submitted successfully"
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Feedback submitted successfully'),
                        ));
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        //clear the input text
                        _feedbackController.clear();
                      },
                    ),
                  ],
                )
              ]),
        ));
  }
}
