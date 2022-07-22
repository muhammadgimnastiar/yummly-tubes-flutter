import 'package:flutter/material.dart';
import 'package:yummly_ui/RecipeDetails.dart';
import 'package:yummly_ui/Recipemodel.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 10),
          ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: RecipeModel.demoRecipe.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 12,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                                recipeModel: RecipeModel.demoRecipe[index],
                              ))),
                  child: RecipeCard(
                    RecipeModel.demoRecipe[index],
                  ),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}

class RecipeCard extends StatefulWidget {
  final RecipeModel recipeModel;
  RecipeCard(
    @required this.recipeModel,
  );

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool saved = false;
  bool loved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Hero(
                  tag: widget.recipeModel.imgPath,
                  child: Image(
                    height: 320,
                    width: 360,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.recipeModel.imgPath),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 30,
              child: InkWell(
                onTap: () {
                  setState(() {
                    saved = !saved;
                  });
                },
                child: Icon(
                  saved
                      ? Icons.bookmark_outlined
                      : Icons.bookmark_border_outlined,
                  color: saved ? Colors.yellow : Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.recipeModel.title,
                        style: Theme.of(context).textTheme.subtitle1),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipeModel.writer,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.timer_outlined,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(widget.recipeModel.cookingTime.toString() + '\''),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          loved = !loved;
                        });
                      },
                      child: Icon(Icons.favorite,
                          color: loved ? Colors.red : Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
