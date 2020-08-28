import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mumcareapp/constants/colors.dart';


class CreatePatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
                        automaticallyImplyLeading: false,

        centerTitle: true,
        title: Text("Create Patient",style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: Container(
        child: Center(child: Text('Create Form')),
      ),
      
    );
  }
}