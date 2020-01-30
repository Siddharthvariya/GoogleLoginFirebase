import 'package:flutter/material.dart';
import 'package:flutter_fire_auth/utils/AuthProvider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Homepage'),
            RaisedButton(
              child: Text("Logout"),
              onPressed: () {
                AurthProvider().logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
