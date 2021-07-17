import 'package:c19app/prescreens/Onboard.dart';
import 'package:c19app/prescreens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final introdate = GetStorage();

  @override
  void initState() {
    super.initState();

    introdate.writeIfNull("displayed", false);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //If the it reads true meaning the onboarding page has been showed before show the Welcome page ; if it says false
      // show the onboarding screen
      home: introdate.read("displayed") ? Splash() : OnBoardingPage(),
      routes: {
        '/splash': (context) => Splash(),
      },
    );
  }
}
