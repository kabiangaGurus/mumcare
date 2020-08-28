import 'package:flutter/material.dart';
import 'package:mumcareapp/models/articles.dart';
import 'package:mumcareapp/screens/admin/articles/articleview.dart';

class ArticlesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: List.generate(choices.length, (index) {
              return Center(
                child: ChoiceCard(choice: choices[index], item: choices[index]),
              );
            })));
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArticlesDetailPage(choice)));
      },
      child: Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(choice.imglink)),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(choice.title,
                        style: Theme.of(context).textTheme.title),
                    Text(choice.date,
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),


                          Text(
                              choice.description.length > 230
                                  ? '${choice.description.substring(0, 230)}..'
                                  : choice.description,
                              ),
                    // Text(choice.description),
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}
