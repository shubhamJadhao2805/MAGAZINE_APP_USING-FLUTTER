import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyHome> {
  bool isLoading = true;
  PDFDocument document;
  var imageUrl = [];

  loadPdfDocument(String url) async {
    document = await PDFDocument.fromURL(
        "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf");
    setState(() {
      isLoading = false;
    });

    print("STARTED");
    StorageReference storageReference =
        FirebaseStorage.instance.ref().;

    var dataBase = await storageReference.getDownloadURL();
    print(dataBase);
    print("END");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPdfDocument("hell");
//
//    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
//    firebaseDatabase
//        .reference()
//        .child("imageUrl")
//        .once()
//        .then((DataSnapshot data) {
//      setState(() {
//        imageUrl = data.value;
//      });
//    });

    //Load Image Urls
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    var array = [];
    int i = 0;
    for (i = 0; i < 15; i++) {
      array.add(random.nextInt(3) + 2);
    }

    void pdfBottomSheet(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PDFViewer(
                document: document,
              ),
            );
          });
    }

    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 70, right: 70),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Here",
                labelText: "Enter Text",
                labelStyle: TextStyle(color: Colors.blueGrey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.redAccent, width: 2)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(20),
              crossAxisCount: 4,
              itemCount: imageUrl.length,
              itemBuilder: (BuildContext context, int index) => new Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: InkResponse(
                        child: Container(
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(30.0)),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                    imageUrl[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(color: Colors.redAccent))),
                        onTap: () {
                          pdfBottomSheet(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, array[index]),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
          )
        ],
      ),
    );
  }
}
