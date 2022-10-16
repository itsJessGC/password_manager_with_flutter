import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:password_manager_flutter/screens/account_delete.dart';
import 'package:password_manager_flutter/styles/app_style.dart';

import 'account_editor.dart';

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
            SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc["creation_date"],
              style: App_Style.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            Text(
              widget.doc["password"],
              style: App_Style.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _deleteAccount(widget.doc.id),
        label: Text("Delete account"),
        icon: Icon(Icons.delete),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Future<void> _deleteAccount(String id) async {

  final _deletedAccount = FirebaseFirestore.instance;

  await _deletedAccount.collection("accounts").doc(id).delete();
}
