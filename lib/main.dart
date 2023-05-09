import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_collector/views/login_view.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                print("You are a verified user");
                return Text("Done");
              } else {
                print("You need to verify your email first");
              }

            default:
              return const Text("Loading...");
          }
        },
      ),
    );
  }
}

class _VerifyEmailViewState extends StatefulWidget {
  const _VerifyEmailViewState({super.key});

  @override
  State<_VerifyEmailViewState> createState() => __VerifyEmailViewStateState();
}

class __VerifyEmailViewStateState extends State<_VerifyEmailViewState> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
