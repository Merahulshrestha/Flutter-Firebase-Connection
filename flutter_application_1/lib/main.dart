import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/loginView.dart';
import 'package:flutter_application_1/notesview.dart';
import 'package:flutter_application_1/registerview.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/verifyemailview.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log; // to use log tools
void main() {
  // Enabling widget binding before Firebase.initializeApp
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
// Function of this page is to initialize firebase only once, ( not in both register and log in view)
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  print('Verified User');
                } else {
                  print('Verfy your email');
                  return const VerifyEmailView();
                }
              } else {
                return const VerifyEmailView();
              }

              return const LoginView();
            // if connection is done print done
            // builde expects return
            default:
              return const CircularProgressIndicator();
            // if connection is not done, return loading
          }
        });
  }
}
