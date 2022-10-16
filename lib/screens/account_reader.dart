import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:password_manager_flutter/styles/app_style.dart';

class AccountReaderScreen extends StatefulWidget {
  AccountReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<AccountReaderScreen> createState() => _AccountReaderScreenState();
}

class _AccountReaderScreenState extends State<AccountReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: App_Style.colorOfCards[color_id],
      appBar: AppBar(
        backgroundColor: App_Style.colorOfCards[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["account_title"],
              style: App_Style.mainTitle,
            ),
            SizedBox(height: 4.0,),
            Text(
              widget.doc["creation_date"],
              style: App_Style.dateTitle,
            ),
            SizedBox(height: 28.0,),
            Text(
              widget.doc["password"],
              style: App_Style.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}