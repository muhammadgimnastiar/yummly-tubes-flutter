import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummly_ui/services/articles.dart';

import '../widget/article_item.dart';
import 'add_article.dart';

class HomeAPI extends StatefulWidget {
  static const route = "/home-api";

  @override
  _HomeAPIState createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      isLoading = true;
      Provider.of<Articles>(context, listen: false).inisialData().then((value) {
        setState(() {
          isLoading = false;
        });
      }).catchError(
        (err) {
          print(err);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error Occured"),
                content: Text(err.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Okay"),
                  ),
                ],
              );
            },
          );
        },
      );

      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Articles>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Article"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              try {
                prov.inisialData();
              } catch (e) {
                if (e == 401) {
                  Navigator.pushNamed(context, '/login');
                }
              }
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (prov.allArticle.isEmpty)
              ? const Center(
                  child: Text(
                    "No Data",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                )
              : SizedBox(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 32,
                    ),
                    itemCount: prov.allArticle.length,
                    itemBuilder: (context, i) => ArticleItem(
                      prov.allArticle[i].id,
                      prov.allArticle[i].title,
                      prov.allArticle[i].image,
                      prov.allArticle[i].content,
                    ),
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AddArticlePage.route),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
