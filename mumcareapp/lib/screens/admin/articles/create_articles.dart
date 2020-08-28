import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mumcareapp/constants/colors.dart';
import 'package:mumcareapp/constants/textstyle.dart';

class CreateArticle extends StatefulWidget {
  @override
  _CreateArticleState createState() => _CreateArticleState();
}

class _CreateArticleState extends State<CreateArticle> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File _image;
  String eventTitle;
  String eventDescription;
  String eventDate;
  String eventLocationName;
  String organiserName;
  String checkventDate;
  String checkventLocation;
  // String checkventOrganiserName;

  final picker = ImagePicker();

  Future selectPhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  clearimage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return new Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: new Form(
            key: _formKey,
            autovalidate: false,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                TextFormField(
                  // ignore: missing_return
                  validator: (value) {
                    String sanitizedVal = value.trim();

                    if (sanitizedVal.isEmpty) {
                      return 'Article Title Required';
                    }
                  },
                  onChanged: (value) {
                    eventTitle = value;
                  },
                  controller: titleController,
                  cursorColor: grey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Article Title',
                  ),
                ),

                TextFormField(
                  // inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],

                  // ignore: missing_return
                  validator: (value) {
                    String sanitizedVal = value.trim();

                    if (sanitizedVal.isEmpty) {
                      return 'Article Description Required';
                    }
                  },
                  onChanged: (value) {
                    eventDescription = value;
                  },
                  controller: descriptionController,
                  cursorColor: grey,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: ' Article Description',
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Divider(),

                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.cloud_upload,
                        color: authlink,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text('Upload a poster'),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(top: 10),
                //   child: Text(
                //     'Your event image represents your event and should capture the experience your attendees have to look forward to. Choose a high resolution photo that\'s unique, inspiring, and catches your attendees\' interest. Use yyy px x zzz px image that\'s no larger than xy MB',
                //     style: TextStyle(color: grey, fontSize: 12),
                //   ),
                // ),

                _image == null
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 20, 8.0, 10),
                        child: DottedBorder(
                          color: greyTint,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          child: Container(
                            height: height * 0.2,
                            child: Center(
                                child: InkWell(
                              onTap: () {
                                selectPhoto();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.cloud_upload,
                                    color: greyTint,
                                  ),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  Text(
                                    'Upload',
                                    style: TextStyle(
                                      color: greyTint,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                showFancyCustomDialog(context);
                                print('Image');
                              },
                              child: Container(
                                height: height * 0.2,
                                width: width * 0.2,
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.check_circle,
                                          color: green,
                                          size: 13.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Upload successful. Click image to preview.",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        clearimage();
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.cancel,
                                            color: red,
                                            size: 13.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text(
                                              "Remove",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                // Container(
                //     height: height * 0.2,
                // child: Image.file(_image),
                //   ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    // color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        onPressed: () {
                          _image == null ?_scaffoldKey.currentState.showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Image Required'),
                                duration: Duration(seconds: 2),
                              )) :
                          // if (_formKey.currentState.validate()) {
                            
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Article Created Successfully'),
                              duration: Duration(seconds: 2),
                            ));
                          // }
                        },
                        color: purple,
                        child: Text("Submit", style: authButton),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void showFancyCustomDialog(BuildContext context) {
    Dialog dialogWithImage = Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.transparent),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Cancel",
                      style: TextStyle(
                          color: authlink,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: authlink,
                          size: 20,
                        ),
                        onPressed: null)
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.44,
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                _image,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(
        context: context, builder: (BuildContext context) => dialogWithImage);
  }
}
