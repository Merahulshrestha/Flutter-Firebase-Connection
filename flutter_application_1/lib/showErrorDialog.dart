import 'package:flutter/material.dart';

// Error handiling for log in view
Future<bool> showErrorDialog(BuildContext context , String text,){
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('An error has occured'),
        content:  Text(text), // to show the error, we are passing parameter text 
        actions: [
          TextButton(onPressed: () {
            // using navigator to cancel the action 
            Navigator.of(context).pop(false);
            
          }, child: const Text('OK'),),
          // TextButton(onPressed: () {
          //   //using navigator to cancel the action
          //   Navigator.of(context).pop(true);
          // }, child: const Text('Log out'),),
        ],
      );
    },
    ).then((value) => value ?? false); 
    // if a user clicks back button without logging in
    // so we are using then value
}
