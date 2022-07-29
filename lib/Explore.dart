import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummly_ui/RecipeDetails.dart';
import 'package:yummly_ui/Recipemodel.dart';
import 'package:yummly_ui/services/favorite.dart';

class Explore extends StatefulWidget {
  const Explore(this.prefs, {Key? key}) : super(key: key);
  final SharedPreferences prefs;

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  void refresh() {
    setState(() {});
  }

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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeDetails(
                                  recipeModel: RecipeModel.demoRecipe[index],
                                  prefs: widget.prefs,
                                  refresh: refresh,
                                )));
                  },
                  child:
                      RecipeCard(RecipeModel.demoRecipe[index], widget.prefs),
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
  final SharedPreferences prefs;
  RecipeCard(
    @required this.recipeModel,
    @required this.prefs,
  );

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  late bool saved =
      widget.prefs.getBool('isFavorite${widget.recipeModel.imgPath}') ?? false;
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
            Consumer<FavoriteService>(
              builder: (context, value, child) => Positioned(
                top: 20,
                right: 30,
                child: InkWell(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      saved = !saved;
                      prefs.setBool(
                          'isFavorite${widget.recipeModel.imgPath}', saved);
                      if (saved) {
                        value.addToFavorite(
                            widget.recipeModel.title,
                            widget.recipeModel.writer,
                            widget.recipeModel.description,
                            widget.recipeModel.cookingTime,
                            widget.recipeModel.servings,
                            widget.recipeModel.imgPath,
                            widget.recipeModel.ingredients);
                      } else {
                        value.deleteToFavorite(
                          widget.recipeModel.imgPath,
                        );
                      }
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
                      width: 50,
                    ),
                    Icon(
                      Icons.timer_outlined,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(widget.recipeModel.cookingTime.toString() + '\''),
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
