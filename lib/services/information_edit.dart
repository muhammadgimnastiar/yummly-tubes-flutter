import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummly_ui/services/information_service.dart';

class InformationEditPage extends StatefulWidget {
  const InformationEditPage({Key? key}) : super(key: key);

  @override
  State<InformationEditPage> createState() => _InformationEditPageState();
}

class _InformationEditPageState extends State<InformationEditPage> {
  final TextEditingController infoBaruController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController preparationController = TextEditingController();
  final TextEditingController cookingController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<InformationService>(
      builder: (context, reciepe, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              GestureDetector(
                  onTap: () {
                    reciepe.deleteInformation(reciepe.selectedIndex!);
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ))
            ],
            title: Text(
              'Recipe Information',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(children: [
              Image.asset('assets/images/information.jpeg'),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                      reciepe.listInformation[reciepe.selectedIndex!]
                          ['nama resep'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Update Reciepe : ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(controller: infoBaruController),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Update Skill : ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(controller: skillController),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Preparation Time : ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(controller: preparationController),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cooking Time: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(controller: cookingController),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Total Time : ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(controller: totalController),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Update Cost range : ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(controller: costController),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      reciepe.updateInformation(
                          reciepe.selectedIndex!,
                          infoBaruController.text,
                          skillController.text,
                          preparationController.text,
                          cookingController.text,
                          totalController.text,
                          costController.text);
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 171, 169, 169),
                      ),
                      child: Text(
                        "Update",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              )
            ]),
          ))),
    );
  }
}
