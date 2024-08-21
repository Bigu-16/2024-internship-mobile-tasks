import 'package:flutter/material.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Terms & Privacy'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Here are the terms and privacy details...'),
            // Add more content as needed
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(),
            TextButton(onPressed: (){
                Navigator.of(context).pop();
            }, child: Text('Accept'))
          ],
        ),
      ],
    );
  }
}