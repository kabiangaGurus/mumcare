// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';


// class AuthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mumcareapp/constants/colors.dart';
import 'package:mumcareapp/constants/textstyle.dart';
import 'package:mumcareapp/screens/admin/dashboard.dart';
import 'package:mumcareapp/screens/mainscreen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhonePin extends StatefulWidget {

  

  final String finaldata;
  VerifyPhonePin(this.finaldata);
  @override
  _VerifyPhonePinState createState() => _VerifyPhonePinState(finaldata);
}

class _VerifyPhonePinState extends State<VerifyPhonePin> {
  var onTapRecognizer;

  StreamController<ErrorAnimationType> errorController;
String finaldata;

  _VerifyPhonePinState(this.finaldata);
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    finaldata = widget.finaldata;
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // const SizedBox(height: 80.0),

            Container(
              margin: const EdgeInsets.only(top: 90.0, left: 30.0, right: 30.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Verify your phone number",
                      textAlign: TextAlign.center,
                      style: birthdayDateH,
                    ),
                    const SizedBox(height: 30.0),
                    RichText(
                text: TextSpan(
                        text: "A 4 digit code has been sent to\n",
                  style: verifyPhonechange,
                  children: <TextSpan>[
                     TextSpan(
                            // text: widget.phoneNumber,
                            text: widget.finaldata,
                            style: verificationnumber,
                          ),
                          
                     TextSpan(
                            style: verifyPhonepin.copyWith(
                              color: authlink,
                            ),
                            text: "\b\rChange ?",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Terms of Service");

                                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>))
                              },
                          ),
                  ],
                ),
              ),
                    // RichText(
                    //   text: TextSpan(
                        // text: "A 4 digit code has been sent to",
                    //     children: [
                          // TextSpan(
                          //   text: widget.phoneNumber,
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 15),
                          // ),
                          // TextSpan(
                          //   style: verifyPhonepin.copyWith(
                          //     color: authlink,
                          //   ),
                          //   text: "Change ?",
                          //   recognizer: TapGestureRecognizer()
                          //     ..onTap = () {
                          //       print("Terms of Service");

                          //       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>))
                          //     },
                          // ),
                    //     ],
                    //     style: TextStyle(color: Colors.black54, fontSize: 15),
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ]),
            ),

            const SizedBox(height: 20.0),

            Container(
              child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 30),
                    child: PinCodeTextField(
                      length: 4,
                      obsecureText: false,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 4) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        borderWidth: 0.0,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: height * 0.1,
                        fieldWidth: width * 0.18,
                        selectedFillColor: greyTint,
                        selectedColor: greyTint,
                        activeFillColor: purpleVerify[500],
                        inactiveFillColor: greyTint,
                        inactiveColor: greyTint,
                      ),
                      textStyle: TextStyle(color: white, fontSize: 38),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: background,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      onCompleted: (v) {
                        print(v);
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                    )),
              ),
            ),

            Container(
              margin:
                  const EdgeInsets.only(top: 30.0, left: 40.0, bottom: 30.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Didn’t receive any code?',
                      textAlign: TextAlign.center, style: authlinksfirst),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      // MaterialPageRoute(builder: (context) => Login()));

                      // Navigator.pushNamed(),
                    },
                    child: Text(
                      'Resend the code',
                      style: TextStyle(
                          color: authlink,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    onPressed: () {
                      print(currentText);
                      Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FadeInUp(child: MainScreen())));
                    },
                    color: purple,
                    child: Text("Verify", style: authButton),
                  ),
                ),
              ),
            ),

            // SizedBox(height: 30.0),

            
          ],
        ),
      ),
    );
  }
}
