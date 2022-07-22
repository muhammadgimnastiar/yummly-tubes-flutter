import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummly_ui/auth.dart';
import 'package:yummly_ui/dummy_data.dart';
import 'package:yummly_ui/screen/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const Route = '/Register';
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  List<Map<String, dynamic>> dataUser = DummyData.data;
  void getdata() async {
    final prefs = await SharedPreferences.getInstance();
    int? currentid = prefs.getInt('id');

    for (var i = 0; i < dataUser.length; i++) {
      if (currentid != null && currentid == dataUser[i]['id']) {
        prefs.setString('nama', dataUser[i]['nama']);
        prefs.setString('nim', dataUser[i]['Nim']);
        Navigator.pushReplacementNamed(context, '/');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState\
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Accounts',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: usernameController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 142, 138, 138)),
                      ),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 220, 216, 216)),
                      hintText: 'Username',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 131, 131, 131)),
                      ),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 220, 216, 216)),
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: TextButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        AuthenticationService service =
                            AuthenticationService(FirebaseAuth.instance);
                        service
                            .signUp(
                                email: usernameController.text,
                                password: passwordController.text)
                            .then((value) {
                          if (value) {
                            Navigator.pushReplacementNamed(context, '/');
                            prefs.setBool('isLogin', true);
                          } else {
                            for (var i = 0; i < dataUser.length; i++) {
                              if (usernameController.text ==
                                      dataUser[i]['username'] &&
                                  passwordController.text ==
                                      dataUser[i]['password']) {
                                prefs.setInt('id', dataUser[i]['id']);
                                prefs.setString('nama', dataUser[i]['nama']);
                                prefs.setString('nim', dataUser[i]['Nim']);
                                Navigator.pushReplacementNamed(context, '/');
                              }
                            }
                          }
                        });
                      },
                      child: const Text(
                        'Sign Up',
                      ),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.grey,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                    ),
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
