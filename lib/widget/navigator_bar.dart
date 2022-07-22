import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummly_ui/screen/home.dart';

import '../screen/pengaturan.dart';
import '../screen/radio.dart';
import '../screen/search.dart';

class NavigatorBarYummly extends StatefulWidget {
  const NavigatorBarYummly(this.prefs, {Key? key}) : super(key: key);
  final SharedPreferences prefs;
  @override
  State<NavigatorBarYummly> createState() => _NavigatorBarYummlyState();
}

class _NavigatorBarYummlyState extends State<NavigatorBarYummly> {
  late int _selectedIndex;
  List<Widget> screen = [
    const Home(),
    const Search(),
    Pengaturan(),
    const radio(),
    const radio(),
  ];
  void initState() {
    super.initState();
    _selectedIndex = widget.prefs.getInt('page') ?? 0;
  }

  void _onTapNavBar(int index) {
    setState(() {
      widget.prefs.setInt('page', index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapNavBar,
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.black), label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio, color: Colors.black), label: "Explore"),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       IconButton(icon: const Icon(Icons.home), onPressed: () {}),
      //       IconButton(
      //           icon: InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) {
      //                       return Search();
      //                     },
      //                   ),
      //                 );
      //               },
      //               child: const Icon(Icons.search)),
      //           onPressed: () {}),
      //       IconButton(
      //           icon: InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) {
      //                       return Pengaturan();
      //                     },
      //                   ),
      //                 );
      //               },
      //               child: const Icon(Icons.person)),
      //           onPressed: () {}),
      //       IconButton(icon: const Icon(Icons.list), onPressed: () {}),
      //       IconButton(
      //           icon: InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) {
      //                       return radio();
      //                     },
      //                   ),
      //                 );
      //               },
      //               child: const Icon(Icons.radio)),
      //           onPressed: () {}),
      //     ],
      //   ),
      // ),
    );
  }
}
