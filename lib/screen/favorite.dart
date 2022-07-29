import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummly_ui/services/favorite.dart';
import 'package:yummly_ui/services/information_edit.dart';
import 'package:yummly_ui/services/information_service.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 120;
    return Consumer<FavoriteService>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Favorite',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                  height: height,
                  child: value.demoRecipe.length != 0
                      ? ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 12,
                          ),
                          itemCount: value.demoRecipe.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Hero(
                                          tag: value.demoRecipe[i]["imgPath"],
                                          child: Image(
                                            height: 320,
                                            width: 360,
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                value.demoRecipe[i]["imgPath"]),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(value.demoRecipe[i]["title"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              value.demoRecipe[i]["writer"],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
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
                                            Text(value.demoRecipe[i]
                                                        ["cookingTime"]
                                                    .toString() +
                                                '\''),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "Belum ada daftar Favorit nih!",
                            style: TextStyle(fontSize: 26),
                          ),
                        )),
            ),
          )),
    );
  }
}
