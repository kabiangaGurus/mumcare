import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumcareapp/constants/colors.dart';
import 'package:mumcareapp/screens/admin/articles/mainArticlePage.dart';
import 'package:mumcareapp/screens/admin/dashboard.dart';
import 'package:mumcareapp/screens/admin/patient/patient.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          SlideInLeft(child: new OfficerDashBoard()),
                    ZoomIn(child: new CreatePatient()),

          SlideInRight(child: new MainArticlePage()),
          // SlideInDown(child: new MyProfilePage()),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: greyTint,
          primaryColor: authlink,

          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.black45),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              // icon: Image(
              //   image: AssetImage("assets/images/drinkicon.png"),
              //   color: Colors.purple[200],
              //   height: 25,
              // ),
              icon: FaIcon(FontAwesomeIcons.clone),

              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
