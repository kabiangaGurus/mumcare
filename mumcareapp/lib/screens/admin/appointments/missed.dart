import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mumcareapp/constants/color2.dart';
import 'package:mumcareapp/constants/colors.dart';

class MissedAppointments extends StatefulWidget {
  @override
  _MissedAppointmentsState createState() => _MissedAppointmentsState();
}

class _MissedAppointmentsState extends State<MissedAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
        centerTitle: true,
        title: Text("Missed AppointMents"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mary Reaky',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Kericho Town',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Misses',
                          style: TextStyle(
                            color: colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
