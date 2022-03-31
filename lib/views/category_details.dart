import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  var data;
   CategoryDetails({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data['title']),
      ),
    );
  }
}
