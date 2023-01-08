import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:password_manager_flutter/styles/app_style.dart';
import 'package:password_manager_flutter/security/encrypted_values.dart';

import 'home_screen.dart';

class AccountEditorScreen extends StatefulWidget {
  AccountEditorScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<AccountEditorScreen> createState() => _AccountEditorScreenState();
}

class _AccountEditorScreenState extends State<AccountEditorScreen> {
  int color_id = Random().nextInt(App_Style.colorOfCards.length);
  String date = DateTime.now().toString();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  void initState() {
    super.initState();
    _titleController.text = widget.doc.get("account_title").toString();
    _mainController.text = Encrypted_Val.decryptMyData(widget.doc.get("password").toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Style.colorOfCards[color_id],
      appBar: AppBar(
        backgroundColor: App_Style.colorOfCards[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Edit Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Account Name',
              ),
              style: App_Style.mainTitle,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: App_Style.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
              ),
              style: App_Style.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: App_Style.accentColor,
        onPressed: () async {
          var updatePlace = FirebaseFirestore.instance.collection("accounts");
          updatePlace
              .doc(widget.doc.id)
              .update({
                "account_title": _titleController.text,
                "creation_date": date,
                "password": Encrypted_Val.encryptMyData(_mainController.text),
                "color_id": color_id
              })
              .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home_Screen())))
              .catchError(
                  (error) => print("Failed to update Account due to $error"));
        },
        child: Icon(Icons.save_outlined),
      ),
    );
  }
}
