import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

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
      appBar: AppBar(
        title: const Text('Register view')
      ),
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
                      try{
                        final userCredential      = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email,
                              password: password);
                        // specilizatig in erro finding using on FirebaseAuthException
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('User not found');
                        } else if(e.code == 'wrong-password'){
                          print('Wrong Pawwsord');
                        } else {
                          print('Something else happened');
                          print('e.code');
                        }                    
                        }
                    },
                    child: const Text('Register '),
                  ),
                  TextButton(onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil('/login/',
                       (route) => false);
                  },
                   child: const Text('Already registered? Login here!'))
                  
                ],
              ),
    ); 
  }
}
