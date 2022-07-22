import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/articles.dart';

class AddArticlePage extends StatelessWidget {
  static const route = "/add-article";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(String title, String image, String content) {
      Provider.of<Articles>(context, listen: false)
          .addArticle(title, image, content)
          .catchError((onError) {
        print(onError);
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error Occured"),
              content: Text("Error : $onError"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OKAY"),
                ),
              ],
            );
          },
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => save(titleController.text, imageController.text,
                contentController.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  controller: imageController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "image",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  controller: contentController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Content",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  save(titleController.text, imageController.text,
                      contentController.text);
                  Navigator.pop(context);
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
