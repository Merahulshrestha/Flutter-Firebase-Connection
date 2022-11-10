import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/showErrorDialog.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  //  Flutter creates InIt state automatically when it creates your homepage
  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter Your Email',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              hintText: 'Enter your password',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final user = await FirebaseAuth.instance
                    .currentUser;
                    // here is if else condition
                    // we are checking if email is verified or not
                    if(user?.emailVerified ?? false){
                      // Navigating from login to notes view
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          notesRoute,
                          (route) => false); 
                    } else {
                      // Navigating from login to notes view
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          verifyEmailRoute,
                          (route) => false); 
                    }
                        
                        
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  await showErrorDialog(context, 'User not found');
                  // error handling in log in screen
                  //using showErrorDiallog
                  devtools.log('User not found');
                } else if (e.code == 'wrong-password') {
                  await showErrorDialog(context, 'Wrong Password');
                  devtools.log('Wrong Password');
                } else {
                  // to handle other unknown errors
                  await showErrorDialog(context, 'Error: ${e.code}');
                }
              } catch(e){
                // catch block to handle other exception that are not from firebase
                await showErrorDialog(context, e.toString());
              }
            },
            child: const Text('Log in'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Not Register ed yet? Register now'))
        ],
      ),
    );
  }
}




