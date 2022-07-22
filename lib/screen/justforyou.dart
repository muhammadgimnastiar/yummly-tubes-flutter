import 'package:flutter/material.dart';
import '../dataawal.dart';
import 'detail.dart';

class JustForYou extends StatefulWidget {
  const JustForYou({Key? key}) : super(key: key);

  @override
  State<JustForYou> createState() => _JustForYouState();
}

class _JustForYouState extends State<JustForYou> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            height: height, child: ListView(children: buildRecipesawal())),
      )),
    );
  }

  List<Widget> buildRecipesawal() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipeawal().length; i++) {
      list.add(BuildMenu(getRecipeawal()[i], context));
    }
    return list;
  }
}

class BuildMenu extends StatelessWidget {
  final Recipeawal recipe;
  const BuildMenu(
    this.recipe,
    BuildContext context, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (DetailHome(recipe: recipe)))),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image.asset(
            recipe.image,
            width: MediaQuery.of(context).size.width,
          ),
          Geradiend(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  recipe.description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Geradiend extends StatelessWidget {
  const Geradiend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87])),
    );
  }
}
