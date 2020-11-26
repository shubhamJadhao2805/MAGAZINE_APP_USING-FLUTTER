import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magzinapp/HomePage.dart';
import 'package:magzinapp/LoginPage.dart';

import 'ContacPage.dart';
import 'PodCast.dart';
import 'globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [
    MyHome(),
    PodCast(),
    ContactUs(),
    AboutUs(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton(
            offset: Offset.fromDirection(2, 100),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70))),
            color: Colors.redAccent,
            padding: EdgeInsets.only(left: 10),
            icon: Icon(
              Icons.menu,
              size: 40,
              color: Colors.blueGrey,
            ),
            tooltip: "This is toolTip",
            onSelected: (value) {
              print(value);
              print("selected");
            },
            elevation: 10,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 180,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            Variables.pageSelected = 0;
                            Navigator.pop(context);
                          });
                        },
                        child: Text("Magazine"),
                      ),
                    ),
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 180,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            Variables.pageSelected = 1;
                            Navigator.pop(context);
                          });
                        },
                        child: Text("Poadcast"),
                      ),
                    ),
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 180,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            Variables.pageSelected = 3;
                            Navigator.pop(context);
                          });
                        },
                        child: Text("About Us"),
                      ),
                    ),
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      width: 180,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text("Write Blog"),
                      ),
                    ),
                  ),
                  value: 1,
                ),
              ];
            },
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              offset: Offset.fromDirection(2, 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70))),
              color: Colors.redAccent,
              padding: EdgeInsets.only(right: 30),
              icon: Icon(
                Icons.account_circle,
                size: 40,
                color: Colors.blueGrey,
              ),
              tooltip: "This is toolTip",
              onSelected: (value) {
                print(value);
                print("selected");
              },
              elevation: 10,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 180,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(Variables.name),
                        ),
                      ),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 180,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Colors.white,
                          onPressed: () {},
                          child: Text("Subscription"),
                        ),
                      ),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 180,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInPage()));
                            });
                          },
                          child: Text("Log In"),
                        ),
                      ),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        width: 180,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              Variables.pageSelected = 2;
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Contact Us"),
                        ),
                      ),
                    ),
                    value: 1,
                  ),
                ];
              },
            )
          ],
        ),
        body: pages[Variables.pageSelected],
      ),
    );
  }
}

//SignUp Page
