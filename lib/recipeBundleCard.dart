import 'package:flutter/material.dart';
import 'package:yummly_ui/recipeBundle.dart';
import 'package:yummly_ui/screen/constans.dart';

class recipeBundleCard extends StatelessWidget {
  final int index;

  recipeBundleCard({this.index = 0});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.8,
        child: Container(
          margin: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
          decoration: BoxDecoration(
            boxShadow: [kBoxShadow],
            color: recipeBundles[index].color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: <Widget>[
                    Spacer(),
                    Text(
                      recipeBundles[index].title,
                      style: TextStyle(fontSize: (18), color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      recipeBundles[index].description,
                      style: TextStyle(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          recipeBundles[index].chefs.toString() + " Chefs",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(Icons.book, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          recipeBundles[index].recipes.toString() + " Recipes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                  ]),
                ),
              ),
              SizedBox(width: 20),
              AspectRatio(
                aspectRatio: 0.80,
                child: Image.asset(
                  recipeBundles[index].imageSrc,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ));
  }
}
