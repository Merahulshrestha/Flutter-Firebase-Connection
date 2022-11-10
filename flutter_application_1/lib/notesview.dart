import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:flutter_application_1/routes.dart'; // to use log tools
enum MenuAction { logout}
class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main UI'),
        actions: [
          // Here we are crating pop of menu buttion
          PopupMenuButton<MenuAction> (
            onSelected: (value) async {
              //To display alert dialog to the user
              switch (value) {
                case MenuAction.logout:
                final shouldLogOut = await showLogOutDialog(context);
                if(shouldLogOut){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                   loginRoute,
                    (_) => false,
                  );
                }
              }
            },
            itemBuilder: (context){
               return [
                const PopupMenuItem(
                value: MenuAction.logout, 
               child: Text('Log out'),
              ),
               ];
            }
          )
        ],
      ),
    );
  }
}


// Creating Logout Funtion to show error dialog
Future<bool> showLogOutDialog(BuildContext context){
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(onPressed: () {
            // using navigator to cancel the action 
            Navigator.of(context).pop(false);
            
          }, child: const Text('Cancel'),),
          TextButton(onPressed: () {
            //using navigator to cancel the action
            Navigator.of(context).pop(true);
          }, child: const Text('Log out'),),
        ],
      );
    },
    ).then((value) => value ?? false); 
    // if a user clicks back button without logging in
    // so we are using then value
}