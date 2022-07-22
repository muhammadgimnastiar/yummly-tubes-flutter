import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummly_ui/Auth.dart';
import 'package:yummly_ui/screen/edit.dart';

class Pengaturan extends StatefulWidget {
  @override
  State<Pengaturan> createState() => _ProfileState();
}

class _ProfileState extends State<Pengaturan> {
  String? nama;
  String? nim;
  String? email;
  final TextEditingController _controller = new TextEditingController();
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama');
      nim = prefs.getString('nim');
      email = prefs.getString('email');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/profil.jpeg',
              width: 200,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${email ?? "Ilang"}',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 14,
                    ),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => edit(
                            nama: nama ?? '',
                          ),
                        ),
                      );
                      setState(() {
                        nama = result;
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Try Yummly Subscription',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Dietary Preference',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Connected Appliances',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'About Yummly',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Feedback & Supprot',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 14,
                    ),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove('email');
                      prefs.remove('id');
                      prefs.setBool('isLogin', false);
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
