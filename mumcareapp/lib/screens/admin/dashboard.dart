import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumcareapp/constants/color2.dart';
import 'package:mumcareapp/constants/textstyle2.dart';

class OfficerDashBoard extends StatefulWidget {
  @override
  _OfficerDashBoardState createState() => _OfficerDashBoardState();
}

class _OfficerDashBoardState extends State<OfficerDashBoard>
    with SingleTickerProviderStateMixin {
  final List<String> entries = <String>['A', 'B', 'C'];

  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 25.0,
              color: colorBlack,
            ),
            onPressed: () {}),
        title: Text(
          "DashBoard",

          style: headerStyle,

          // style: TextStyle(
          //     fontWeight: FontWeight.w700,
          //     fontSize: 19.0,
          //     color: colorBlack,
          //     fontFamily: "Sofia"),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: colorBlack,
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: FaIcon(FontAwesomeIcons.bell),
                  onPressed: () {
                    // Navigator.of(context)
                    // .push(MaterialPageRoute(builder: (context) => NotificationsPage()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 30,
                  // child: Row(
                  //   children: <Widget>[
                  //     Text(
                  //       "List Of Account",
                  //       style: header2Style,
                  //     )
                  //   ],
                  // ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        child: Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                      end: FractionalOffset.centerLeft,
                                      begin: FractionalOffset.centerRight,
                                      colors: [
                                        Colors.purpleAccent,
                                        Colors.deepPurple
                                      ])),
                              width: MediaQuery.of(context).size.width * .45,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Active Members",
                                      style: cardStyle,
                                    ),
                                  ),
                                  Text(
                                    "300",
                                    style: card2Style,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      const Color(0xffFBD8C6),
                                      const Color(0xffFF978D),
                                    ])),
                            width: MediaQuery.of(context).size.width * .45,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Appointments",
                                    style: cardStyle,
                                  ),
                                ),
                                Text(
                                  "20",
                                  style: card2Style,
                                ),

                                // Icons.audiotrack,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    end: FractionalOffset.centerLeft,
                                    begin: FractionalOffset.centerRight,
                                    colors: [
                                      const Color(0xffFFEBFDFC),
                                      const Color(0xff51eddb),
                                    ])),
                            width: MediaQuery.of(context).size.width * .45,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Missed ",
                                    style: cardStyle,
                                  ),
                                ),
                                Text(
                                  "10",
                                  style: card2Style,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              // Stack(
              //   children: [
              //     Center(
              //       child: Card(
              //         elevation: 4,
              //         color: colorGrey,
              //         child: Container(
              //           width: MediaQuery.of(context).size.width - 40,
              //           height: 100,
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       bottom: 5,
              //       child: Card(
              //         child: InkWell(
              //           splashColor: Colors.blue.withAlpha(30),
              //           onTap: () {
              //             print('Card tapped.');
              //           },
              //           child: Container(
              //             width: MediaQuery.of(context).size.width,
              //             height: 100,
              //             child: Center(
              //                 child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text(
              //                   '\$48000.00',
              //                   style: card1Style,
              //                 ),
              //                 Text('Total Balance'),
              //               ],
              //             )),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text(
                        "Last Record Seen",
                        style: header2Style,
                      ),
                    ],
                  ),
                ),
              ),

              Container(
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
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Seen',style: TextStyle(
                              color: colorWhite,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
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
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Seen',style: TextStyle(
                              color: colorWhite,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              
              Container(
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
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Seen',style: TextStyle(
                              color: colorWhite,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              
              Container(
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
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Seen',style: TextStyle(
                              color: colorWhite,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              ),



              Container(
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
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Seen',style: TextStyle(
                              color: colorWhite,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),



              Container(
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
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Seen',style: TextStyle(
                              color: colorWhite,
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
