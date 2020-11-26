import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Text",
                  labelText: "Enter Name",
                  labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.blueGrey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Text ",
                  labelText: "Enter Email",
                  labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blueGrey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Text",
                  labelText: "Your Company ",
                  labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.blueGrey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Enter Text",
                  labelText: "Your Message",
                  labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  prefixIcon: Icon(
                    Icons.message,
                    color: Colors.blueGrey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ButtonTheme(
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  color: Colors.redAccent,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//AboutUs

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "About Magzine",
              style: TextStyle(color: Colors.red[300], fontSize: 25),
            ),
            SizedBox(height: 200),
            Text(
              "Team",
              style: TextStyle(color: Colors.red[300], fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
