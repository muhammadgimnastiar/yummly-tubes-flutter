import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Consumer<InformationService>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Favorite',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  value.createInformation();
                },
                color: Colors.black,
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(),
          )),
    );
  }
}
