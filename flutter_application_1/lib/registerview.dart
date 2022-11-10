import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/showErrorDialog.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      appBar: AppBar(title: const Text('Register view')),
      body: Column(
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
              // Firebase needs initialization before other calls to Firebase
              final email = _email.text;
              final password = _password.text;
              try {
                 await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password);
                        // Code from here ( look down)
                        final user = FirebaseAuth.instance.currentUser;
                        await user?.sendEmailVerification();
                        // to here, sends conformation email after registration.
                        Navigator.of(context).pushNamed(verifyEmailRoute);

                // specilizating error finding using on FirebaseAuthException
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  devtools.log('user not found');
                } else if (e.code == 'weak-password') {
                  await showErrorDialog(context, 'Weak Password');
                  devtools.log('Wrong Pawwsord');
                } else if (e.code == 'email-already-in-use') {
                  await showErrorDialog(context, 'Email already in use');
                  devtools.log('Email already in use');
                } else if (e.code == 'invalid-email') {
                  await showErrorDialog(context, 'This is an invalid email adress');
                  devtools.log('Invalid Email');
                } else {
                  await showErrorDialog(context, 'Error: ${e.code}');
                  // to handle unknown error
                }
              }
            },
            child: const Text('Register '),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text('Already registered? Login here!'))
        ],
      ),
    );
  }
}
