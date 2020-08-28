import 'package:flutter/material.dart';
import 'package:mumcareapp/constants/colors.dart';
import 'package:mumcareapp/screens/admin/articles/articles.dart';
import 'package:mumcareapp/screens/admin/articles/create_articles.dart';

class MainArticlePage extends StatefulWidget {
  @override
  _MainArticlePageState createState() => _MainArticlePageState();
}

class _MainArticlePageState extends State<MainArticlePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: "Articles"),
    Tab(text: "Create Articles"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: black,
        ),
        backgroundColor: grey,
        bottom: TabBar(
          indicatorColor: authlink,
          // labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
          labelColor: white,
          unselectedLabelColor: black,
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when user swapped
          },
          controller: _controller,
          tabs: list,
        ),
        centerTitle: true,
        title: Text(
          'Create Education',
          style: TextStyle(color: black),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
                    ArticlesHomePage(),

          CreateArticle(),
        ],
      ),
    );
  }
}
