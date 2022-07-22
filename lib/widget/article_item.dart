import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yummly_ui/services/articles.dart';

import '../screen/edit_article.dart';

class ArticleItem extends StatelessWidget {
  final String id, title, image, content;

  ArticleItem(this.id, this.title, this.image, this.content);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Articles>(context, listen: false);

    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, EditArticlePage.route, arguments: id);
      },
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.network(
            image,
            width: 300,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
      title: Text("$title"),
      subtitle: Text(
        "$content",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          prov.deleteArticle(id);
        },
      ),
    );
  }
}
