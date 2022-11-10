import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';


class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(children: [
          Text('We\'ve sent you an email verification. Please open it to verify your account'),
          Text('If you haven\'t received a verification email yet, press the button below'),
          TextButton(onPressed: () async{
            final user = FirebaseAuth.instance.currentUser;
            await  user?.sendEmailVerification();
                      // to send email verification to the user
          },
           child: const Text('Send ema il Verification'),),

           TextButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
                      // to send email verification to the user
          },
           child: const Text('Restart'),),

        ],
        ),
    );

  }
}