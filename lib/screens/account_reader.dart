import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:password_manager_flutter/screens/account_delete.dart';
import 'package:password_manager_flutter/screens/account_editor.dart';
import 'package:password_manager_flutter/styles/app_style.dart';
import 'package:password_manager_flutter/security/encrypted_values.dart';

import 'account_creator.dart';

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
            ElevatedButton.icon(
              onPressed: () => _deleteAccount(widget.doc.id).then((value) => Navigator.pop(context)),
              label: Text("Delete account"),
              icon: Icon(Icons.delete),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
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
              Encrypted_Val.decryptMyData(widget.doc["email"]),
              style: App_Style.mainContent,
            ),
            SizedBox(
              height: 28.0,
            ),
            Text(
              Encrypted_Val.decryptMyData(widget.doc["username"]),
              style: App_Style.mainContent,
            ),
            SizedBox(
              height: 28.0,
            ),
            Text(
              Encrypted_Val.decryptMyData(widget.doc["password"]),
              style: App_Style.mainContent,
            ),
            SizedBox(
              height: 28.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AccountEditorScreen(widget.doc)));
        },
        label: Text("Edit account"),
        icon: Icon(Icons.edit),
      ),
    );
  }
}

Future<void> _deleteAccount(String id) async {
  final _deletedAccount = FirebaseFirestore.instance;

  await _deletedAccount.collection("accounts").doc(id).delete();
}
