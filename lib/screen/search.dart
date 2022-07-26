import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummly_ui/detail.dart';
import 'package:yummly_ui/screen/constans.dart';
import 'package:yummly_ui/shared.dart';
import 'package:yummly_ui/data.dart';

class Search extends StatefulWidget {
  Search(this.prefs, {Key? key}) : super(key: key);

  SharedPreferences prefs;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<bool> optionSelected = [true, false, false];

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    buildTextTitleVariation1('Trending Now'),
                    buildTextSubTitleVariation1(
                        'Healthy and nutritious food recipes'),
                    const SizedBox(
                      height: 32,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          option(
                              'Vegetable', 'assets/images/icons/salad.png', 0),
                          const SizedBox(
                            width: 8,
                          ),
                          option('Rice', 'assets/images/icons/rice.png', 1),
                          SizedBox(
                            width: 8,
                          ),
                          option('Fruit', 'assets/images/icons/fruit.png', 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 350,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildRecipes(refresh),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    buildTextSubTitleVariation2('Popular', false),
                    SizedBox(
                      width: 8,
                    ),
                    buildTextTitleVariation2('Food', true),
                  ],
                ),
              ),
              Container(
                height: 190,
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  children: buildPopulars(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget option(String text, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                image,
                color: optionSelected[index] ? Colors.black : Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildRecipes(Function() refresh) {
    List<Widget> list = [];
    for (var i = 0; i < getRecipe().length; i++) {
      list.add(buildRecipe(getRecipe()[i], i, context, widget.prefs, refresh));
    }
    return list;
  }
}

class buildRecipe extends StatefulWidget {
  buildRecipe(this.recipe, this.index, this.context, this.prefs, this.refresh,
      {Key? key})
      : super(key: key);
  final Recipe recipe;
  final int index;
  final BuildContext context;
  final SharedPreferences prefs;
  final Function() refresh;
  late bool isFavorite =
      prefs.getBool('isFavoriteSearch${recipe.image}') ?? false;
  @override
  State<buildRecipe> createState() => _buildRecipeState();
}

class _buildRecipeState extends State<buildRecipe> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.isFavorite = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Detail(recipe: widget.recipe)),
        );
        setState(() {
          widget.prefs.setBool(
              'isFavoriteSearch${widget.recipe.image}', widget.isFavorite);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(
            right: 16, left: widget.index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: widget.recipe.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.recipe.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            buildRecipeTitle(widget.recipe.title),
            buildTextSubTitleVariation1(widget.recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCalories(widget.recipe.calories.toString() + " Kcal"),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isFavorite = !widget.isFavorite;
                      widget.prefs.setBool(
                          'isFavoriteSearch${widget.recipe.image}',
                          widget.isFavorite);
                    });

                    print('isFavoriteSearch${widget.recipe.image}');
                  },
                  child: Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildPopulars() {
  List<Widget> list = [];
  for (var i = 0; i < getRecipe().length; i++) {
    list.add(buildPopular(getRecipe()[i]));
  }
  return list;
}

Widget buildPopular(Recipe recipe) {
  return Container(
    margin: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      boxShadow: [kBoxShadow],
    ),
    child: Row(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipe.image),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRecipeTitle(recipe.title),
                buildRecipeSubTitle(recipe.description),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCalories(recipe.calories.toString() + " Kcal"),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
