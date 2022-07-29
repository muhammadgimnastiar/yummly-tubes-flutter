import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummly_ui/Explore.dart';
import 'package:yummly_ui/firebase_options.dart';
import 'package:yummly_ui/notif.dart';
import 'package:yummly_ui/screen/add_article.dart';
import 'package:yummly_ui/screen/edit_article.dart';
import 'package:yummly_ui/screen/home.dart';
import 'package:yummly_ui/screen/home_api.dart';
import 'package:yummly_ui/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yummly_ui/screen/search.dart';
import 'package:yummly_ui/services/articles.dart';
import 'package:yummly_ui/services/favorite.dart';
import 'package:yummly_ui/widget/navigator_bar.dart';

import 'services/information_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotif();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs));
}

class MyApp extends StatelessWidget {
  const MyApp(this.prefs, {Key? key}) : super(key: key);

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InformationService>(
      create: (_) => InformationService(),
      child: ChangeNotifierProvider<Articles>(
        create: (_) => Articles(),
        child: ChangeNotifierProvider<FavoriteService>(
          create: (_) => FavoriteService(),
          child: MaterialApp(
            title: 'Resep Masakan',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.yellow,
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 251, 227, 7), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1)))),
            //home: Home();

            //untuk pindah hal (navigation)
            initialRoute: prefs.getBool('isLogin') == true ? '/' : '/login',
            routes: {
              '/': (_) => NavigatorBarYummly(prefs),
              '/search': (_) => Search(prefs),
              '/explore': (_) => Explore(prefs),
              '/login': (_) => const Login(),
              '/home-api': (_) => HomeAPI(),
              '/add-article': (_) => AddArticlePage(),
              '/edit-article': (_) => EditArticlePage(),
            },
          ),
        ),
      ),
    );
  }
}
