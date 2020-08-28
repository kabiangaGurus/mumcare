
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
// import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:mumcareapp/constants/colors.dart';
import 'package:mumcareapp/constants/textstyle.dart';
import 'package:mumcareapp/screens/auth_creen.dart';

class VerifyPhone extends StatefulWidget {
  // String phone;

  // VerifyPhone({this.phone});
  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone>
    with TickerProviderStateMixin {
  // Validation validation = new Validation();
  String countryName = "";
  String phoneCode = '';

  String finaldata;

  TextEditingController phoneController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // String phone = '+254';

    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: <Widget>[
                    Image.asset(
            "assets/stethoscope.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),

          _title(height, width),
          // _subTitle(height, width),
          _sendCodeBtn(height, width),
          // _extraDetails(height, width),
          //   _phoneField(height, width),
          _phone(height, width),
        ],
      ),
    );
  }

  // _buildCountryPickerDropdown(
  //         {bool filtered = false,
  //         bool sortedByIsoCode = false,
  //         bool hasPriorityList = false}) =>
  //     Row(
  //       children: <Widget>[
  //         CountryPickerDropdown(
  //           initialValue: 'KE',
  //           itemBuilder: _buildDropdownItem,
  //           priorityList: hasPriorityList
  //               ? [
  //                   CountryPickerUtils.getCountryByIsoCode('KE'),
  //                   CountryPickerUtils.getCountryByIsoCode('UG'),
  //                   CountryPickerUtils.getCountryByIsoCode('TZ'),
  //                   CountryPickerUtils.getCountryByIsoCode('DJ'),
  //                 ]
  //               : null,
  //           onValuePicked: (Country country) {
  //             setState(() {
  //               phoneController.clear();
  //               countryName = country.name;
  //               phoneCode = country.phoneCode;
  //               phoneController.text = '+' + phoneCode + phoneController.text;
  //             });
  //             print(phoneCode);
  //           },
  //         ),
  //       ],
  //     );

  // Widget _buildDropdownItem(Country country) => Container(
  //       child: Row(
  //         children: <Widget>[
  //           CountryPickerUtils.getDefaultFlagImage(country),
  //           SizedBox(
  //             width: 8.0,
  //           ),
  //         ],
  //       ),
  //     );
  // Widget _phoneField(height, width) {
  //   return Positioned(
  //     top: height * .70,
  //     left: width * .08,
  //     right: width * .08,
  //     child: Row(
  //       children: <Widget>[
  //         TextFormField(
  //           controller: phoneController,
  //           decoration: InputDecoration(
  //             focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: greyTint, width: 1.0),
  //             ),
  //             border: OutlineInputBorder(),
  //             // prefixIcon: Icon(
  //             //   Icons.access_alarm,
  //             // ),
  //             labelText: '+254 706 427 718',
  //             labelStyle: titlePhoneVerifyStyle.copyWith(
  //               fontSize: 16,
  //               fontWeight: FontWeight.normal,
  //             ),
  //             fillColor: grey,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _phone(height, width) {
    return Positioned(
      top: height * .38,
      left: width * .08,
      right: width * .08,
      child: Container(
        padding: EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(8.0),
          color: Color(0xFFE7E7E7),
        ),
        width: width * .84,
        height: height * .057,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Flexible(
              //   flex: 1,
              //   child: _buildCountryPickerDropdown(hasPriorityList: true),
              // ),
              Flexible(
                flex: 2,
                child: TextFormField(
                  // validator: validation.validatePhone,
                  // validator: (phone) {
                  //   if (phone.isEmpty) {
                  //     return 'Phone required';
                  //   } else if (phone == null) {
                  //     return 'Enter something';
                  //   } else if (phone.length < 13) {
                  //     return ('13 characters expected');
                  //   } else if (!phone.startsWith('+')) {
                  //     return 'Correct format needed';
                  //   }
                  //   return null;
                  // },

                  ///Automatically set the code for the user
                  controller: phoneController,
                  
                  onChanged: (val) {
                    finaldata = phoneController.text;

                    // print('Controller' + phoneController.text);
                    // print(finaldata + 'final');
                  },
                  cursorColor: purple,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Phone Number',
                    // hintStyle: titlePhoneVerifyStyle.copyWith(
                    //   fontSize: 6,
                    //   color: red,
                    //   fontWeight: FontWeight.normal,
                    // ),
                  ),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    new LengthLimitingTextInputFormatter(13),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(height, width) {
    return Positioned(
      top: height * .11,
      left: width * .04,
      right: width * .04,
      child: Text(
        'MUM CARE',
        textAlign: TextAlign.center,
        style: titlePhoneVerifyStyle.copyWith(
          fontSize: 50,
        ),
      ),
    );
  }

  Widget _sendCodeBtn(height, width) {
    return Positioned(
      left: width * .08,
      right: width * .08,
      top: height * .6,
      child: Container(
        width: width * .2,
        height: height * .057,
        child: FlatButton(
          
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ZoomIn(child: VerifyPhonePin(finaldata))));
            if (_formkey.currentState.validate()) {
              _formkey.currentState.save();
              {
                //Code to send Code to phone
              }
            }
          },
          color: purple,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: Text(
            'Submit',
            style: actionBtnStyle,
          ),
        ),
      ),
    );
  }

  Widget _subTitle(height, width) {
    return Positioned(
      top: height * .23,
      left: width * .08,
      right: width * .08,
      child: Text(
        'Add your phone number. We\'ll send you a \n verification code so we know you\'re real.',
        textAlign: TextAlign.center,
        style: subTitlePhoneVerifyStyle,
      ),
    );
  }

  // Widget _extraDetails(height, width) {
  //   return Positioned(
  //     top: height * .54,
  //     left: width * .11,
  //     child: RichText(
  //       text: TextSpan(
  //         text:
  //             'By providing my phone number, I hereby agree and accept the\n ',
  //         style: extraDetailsBlackStyle,
  //         children: <TextSpan>[
  //           TextSpan(
  //             text: ' Terms of Service ',
  //             style: extraDetailsRedStyle,
  //           ),
  //           TextSpan(
  //             text: 'and',
  //             style: extraDetailsBlackStyle,
  //           ),
  //           TextSpan(
  //             text: ' Privacy Policy ',
  //             style: extraDetailsRedStyle,
  //           ),
  //           TextSpan(
  //             text: 'in the use of Parte app',
  //             style: extraDetailsBlackStyle,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
