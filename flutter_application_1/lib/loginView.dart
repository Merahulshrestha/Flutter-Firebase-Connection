import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

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
  void dispose (){
    _email.dispose();
    _password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  decoration:  const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                ), 
                TextButton(
                  onPressed:() async{ 
                                      
                    final email = _email.text;
                    final password = _password.text;
                    try{
                      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, 
                      password: password
                      );
                    } on FirebaseAuthException catch (e){
                      if(e.code == 'weak-password'){
                        print('Weak Password');
                                                                      } else if (e.code == 'email-already-in-use') {
                        print('Email is already in use');
                      } else if (e.code == 'invalid-email'){
                        print('Invalid email');
                      }
                    }
                  },
                 child: const Text('Log in'),
                ),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/register/', (route) => false,
                  );}, 
                child: const Text('Not Register ed yet? Register now'))
              ],
            ),
    );
  }
}