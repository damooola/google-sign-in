import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// initializing firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //current user in the app
  User? _user;

  @override
  void initState() {
    super.initState();

    // set the user to the passed event
    _auth.authStateChanges().listen(
      (event) {
        setState(() {
          _user = event;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Sign In"),
        centerTitle: true,
      ),
      body: _user != null ? _userInfo() : _googleSignInButton(),
    );
  }

  Widget _userInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(_user!.photoURL!)),
            ),
          ),
          Text(_user!.email!),
          Text(_user!.displayName ?? ""),
          MaterialButton(
            color: Colors.black,
            onPressed: _signOut,
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: SignInButton(Buttons.google,
            text: "Sign Up With Google", onPressed: _handleGoogleSignin),
      ),
    );
  }

  void _handleGoogleSignin() async {
    try {
      GoogleAuthProvider googleAuthprovider = GoogleAuthProvider();
      await _auth.signInWithProvider(googleAuthprovider);
    } on FirebaseAuthException catch (error) {
      showErrorMessage("${error.message}");
    }
  }

  showErrorMessage(String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(error),
      ),
    );
  }

  void _signOut() {
    _auth.signOut();
  }
}
