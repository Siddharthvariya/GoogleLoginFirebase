import 'package:flutter/material.dart';
import 'package:flutter_fire_auth/utils/AuthProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              RaisedButton(
                child: Text('Login with Google'),
                onPressed: () async {
                  bool res = await AurthProvider().loginWithGoogle();
                  if (!res) {
                    print("Errore login with google");
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Errore login with google'),
                      duration: Duration(seconds: 3),
                    ));
                  } else {
                    print("Google login scuuess");
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Google login scuuess'),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter email"),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Login"),
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    print("Email and Password cat be emapty.");

                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Email and Password cat be emapty.'),
                      duration: Duration(seconds: 3),
                    ));
                    return;
                  }

                  bool res = await AurthProvider().signInWithEmail(
                      _emailController.text, _passwordController.text);
                  if (!res) {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Login Failed'),
                      duration: Duration(seconds: 3),
                    ));
                  }
                  print("Login Failed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
