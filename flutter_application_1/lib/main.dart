import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
void main() {
  // Enabling widget binding before Firebase.initializeApp
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Register')
      ),
      body: FutureBuilder(
        // FutureBuilder = HomePage can initializeApp using a FutureBuilder
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            
            case ConnectionState.none:
              return Column(
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
                  // Firebase needs initialization before other calls to Firebase
                  await Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform,
                  );
                  final email = _email.text;
                  final password = _password.text;
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email, 
                    password: password
                    
                    );
                },
               child: const Text('Register'),
              ),
            ],
          );
              defult: const Text('Loading....');
           
            case ConnectionState.waiting:
              // TODO: Handle this case.
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              // TODO: Handle this case.
              break;
          }
          
        }
      ),
    )
    );
  }
}
