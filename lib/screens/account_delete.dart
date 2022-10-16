import 'package:flutter/material.dart';
import 'package:password_manager_flutter/screens/home_screen.dart';

class AccountDeleteScreen extends StatefulWidget {
  const AccountDeleteScreen({Key? key}) : super(key: key);

  @override
  State<AccountDeleteScreen> createState() => _AccountDeleteScreenState();
}

class _AccountDeleteScreenState extends State<AccountDeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Screen()));
        },
        label: Text("Accept"),
        icon: Icon(Icons.info),
      ),
    );
  }
}