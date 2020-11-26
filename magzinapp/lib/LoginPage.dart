import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magzinapp/HomePage.dart';
import 'package:magzinapp/main.dart';
import 'globals.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();
  final GlobalKey<FormState> _formKeyTwo = GlobalKey<FormState>();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
              child: ListTile(
            leading: CircularProgressIndicator(),
            title: Text("Please wait..."),
          )),
        );
      },
    );
  }

  void _login(BuildContext ctx) async {
    _showMyDialog();
    print(emailControler.text);
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: emailControler.text, password: passControler.text))
          .user;

      if (user != null) {
        DatabaseReference reference = FirebaseDatabase.instance
            .reference()
            .child("Auth")
            .child(user.uid)
            .child("name");
        reference.once().then((DataSnapshot data) {
          print(data.value);
          setState(() {
            Variables.name = data.value.toString();
          });

          Navigator.pop(context);
          Navigator.pop(context);
        });
      } else {
        Scaffold.of(ctx).showSnackBar(SnackBar(
          content: Text("Failed"),
        ));
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text("Failed"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Form(
                    key: _formKeyTwo,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Welcome",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Back.",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            width: 120,
                            height: 5,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailControler,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 3),
                              ),
                              labelText: "Enter Text"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passControler,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 3)),
                              labelText: "Enter Text"),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: FlatButton(
                            child: Text(
                              "Forgot Paswword!",
                              textAlign: TextAlign.right,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        ButtonTheme(
                          minWidth: double.infinity,
                          height: 50,
                          child: Builder(
                            builder: (ctx) => RaisedButton(
                              onPressed: () {
                                if (_formKeyTwo.currentState.validate()) {
                                  _login(ctx);
                                }
                              },
                              shape: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(color: Colors.white)),
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          "OR",
                          style: TextStyle(fontSize: 25),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: FlatButton(
                          child: Text(
                            "New User? SignUp",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//SignUp

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController namecontroler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passControler = TextEditingController();

  bool _success = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Account.",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 120,
                        height: 5,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: namecontroler,
                      decoration: InputDecoration(
                          labelText: "Enter Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 3),
                          ),
                          hintText: "Enter Text"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailControler,
                      decoration: InputDecoration(
                          labelText: "Enter Email",
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 3)),
                          hintText: "Enter Text"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passControler,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 3),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _register();
                          }
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white)),
                        child: Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      "OR",
                      style: TextStyle(fontSize: 25),
                    )),
                    Center(
                        child: FlatButton(
                      child: Text(
                        "Already have an account? Sign In",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
              child: ListTile(
            leading: CircularProgressIndicator(),
            title: Text("Please wait..."),
          )),
        );
      },
    );
  }

  void _register() async {
    _showMyDialog();
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: emailControler.text, password: passControler.text))
        .user;
    if (user != null) {
      print("success");
      DatabaseReference fd =
          FirebaseDatabase.instance.reference().child("Auth").child(user.uid);

      var userData = {"name": namecontroler.text, "email": emailControler.text};

      fd.set(userData).whenComplete(() => Navigator.pop(context));
      Variables.name = namecontroler.text;

      setState(() {
        _success = true;
      });
    } else {
      print("failed");
    }
  }
}
