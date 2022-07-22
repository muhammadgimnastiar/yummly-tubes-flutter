import 'package:flutter/material.dart';

class edit extends StatefulWidget {
  final String nama;

  const edit({Key? key, required this.nama}) : super(key: key);

  @override
  State<edit> createState() => _EditState();
}

class _EditState extends State<edit> {
  String nama = ' ';
  String email = 'dindajul96@gmail.com';
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TextEditingController(text: widget.nama);
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(137, 59, 55, 55),
          title: Text('Edit'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintStyle: TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
              hintText: 'Change Username?',
            ),
            controller: _controller,
            onSubmitted: (value) {
              Navigator.pop(context, _controller.text);
            },
          ),
        ),
      );
}
