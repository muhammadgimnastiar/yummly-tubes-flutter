import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummly_ui/services/information_edit.dart';
import 'package:yummly_ui/services/information_service.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformationService>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Recipe Information',
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/information.jpeg',
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 25.0, top: 0, right: 23.0, bottom: 0),
                    padding: EdgeInsets.only(
                        left: 10.0, top: 18, right: 10.0, bottom: 0),
                    child: SizedBox(
                      height: 450,
                      child: Consumer<InformationService>(
                        builder: (context, information, _) => ListView.builder(
                          itemCount: information.listInformation.length,
                          itemBuilder: (context, index) {
                            MainAxisAlignment alignment =
                                MainAxisAlignment.start;
                            return GestureDetector(
                              onTap: () {
                                information.selectedIndex = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InformationEditPage()));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: alignment,
                                    children: [
                                      SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Recipe Name: ',
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Text(
                                        information.listInformation[index]
                                            ['nama resep'],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: alignment,
                                    children: [
                                      SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Skills: ',
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Text(
                                        information.listInformation[index]
                                            ['skills'],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: alignment,
                                    children: [
                                      SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Preparation Time: ',
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Text(
                                        information.listInformation[index]
                                            ['preparation time'],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: alignment,
                                    children: [
                                      SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Cooking Time: ',
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Text(
                                        information.listInformation[index]
                                            ['cooking time'],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: alignment,
                                    children: [
                                      SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Total Time: ',
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Text(
                                        information.listInformation[index]
                                            ['total time'],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: alignment,
                                    children: [
                                      SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Cost Range: ',
                                            style: TextStyle(fontSize: 15),
                                          )),
                                      Text(
                                        information.listInformation[index]
                                            ['cost range'],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
