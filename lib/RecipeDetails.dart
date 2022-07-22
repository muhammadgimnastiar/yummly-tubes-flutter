import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yummly_ui/Recipemodel.dart';

class RecipeDetails extends StatelessWidget {
  final RecipeModel recipeModel;
  RecipeDetails({
    required this.recipeModel,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: (size.height / 2),
        maxHeight: (size.height / 1.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: recipeModel.imgPath,
                  child: Image(
                    height: (size.height / 2) + 50,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(recipeModel.imgPath),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 40,
                child: InkWell(
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                recipeModel.title,
                style: _textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                recipeModel.writer,
                style: _textTheme.caption,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("199"),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.timer_outlined,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(recipeModel.cookingTime.toString() + '\''),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.black,
                    height: 30,
                    width: 2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(recipeModel.servings.toString() + '  Servings'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.black,
                          indicatorColor: Colors.black,
                          indicatorWeight: 3,
                          unselectedLabelColor: Colors.black.withOpacity(0.3),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          tabs: [
                            Tab(
                              text: "Ingredient".toUpperCase(),
                            ),
                            Tab(
                              text: "Calories".toUpperCase(),
                            ),
                            Tab(
                              text: "Reviews".toUpperCase(),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Ingredients(recipeModel: recipeModel),
                              Container(
                                child: Text("Calories"),
                              ),
                              Container(
                                child: Text("Reviews"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  final RecipeModel recipeModel;
  Ingredients({
    required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            //physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipeModel.ingredients.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.black.withOpacity(0.3),
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('-  ' + recipeModel.ingredients[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
