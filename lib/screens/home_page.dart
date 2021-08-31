// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:c19app/prescreens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:c19app/screens/news.dart';
import 'package:c19app/settings/notifications.dart';
import 'package:c19app/settings/profile.dart';
import 'package:c19app/settings/settings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/home_page_widgets/home_categories.dart';
import 'package:c19app/widgets/profile_menu.dart';
import 'package:c19app/widgets/profile_pic.dart';
import 'package:c19app/widgets/home_page_widgets/home_categories.dart';
import '../widgets/countryDropdown.dart';
import 'package:c19app/screens/statsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

String _country = 'USA';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentPage = 0;

  List<Navi> _items = [
    Navi(
        icon: Icon(Icons.home),
        title: Text("Home"),
        widget: Page1(),
        naviKey: GlobalKey<NavigatorState>()),
    Navi(
        icon: Icon(Icons.insert_chart),
        title: Text("Stats"),
        widget: statisticsPage(),
        naviKey: GlobalKey<NavigatorState>()),
    Navi(
        icon: Icon(Icons.list),
        title: Text("Guide"),
        widget: Page3(),
        naviKey: GlobalKey<NavigatorState>()),
    Navi(
        icon: Icon(Icons.person),
        title: Text("Account"),
        widget: Page4(),
        naviKey: GlobalKey<NavigatorState>())
  ];

  Widget _navigationTab({GlobalKey<NavigatorState> naviKey, Widget widget}) {
    return Navigator(
      key: naviKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }

  void _selectTab(int index) {
    if (index == _currentPage) {
      _items[index].naviKey.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = index;
      });
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Color(0xffFF4C29),
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPage,
      onTap: (int index) {
        _selectTab(index);
      },
      items: _items
          .map((e) => BottomNavigationBarItem(icon: e.icon, title: e.title))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _items[_currentPage].naviKey.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != 0) {
            _selectTab(1);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
            index: _currentPage,
            children: _items
                .map(
                    (e) => _navigationTab(naviKey: e.naviKey, widget: e.widget))
                .toList()),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }
}

class Navi {
  final Widget widget;
  final Icon icon;
  final Widget title;
  final GlobalKey<NavigatorState> naviKey;
  Navi({this.widget, this.icon, this.title, this.naviKey});
}

//PAGE 1
class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color(0xff1E3163),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        //centerTitle: false,
        // title:Text(
        //   "PRO-VID",
        //   style: const TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 25.0),
        // ),
      ),
      // appBar: AppBar(title: Text("Page 1"), actions: <Widget>[
      //   IconButton(
      //       icon: Icon(Icons.ac_unit),
      //       onPressed: () {
      //         Navigator.of(context, rootNavigator: false).push(
      //             MaterialPageRoute(
      //                 builder: (BuildContext context) => new Page1()));
      //       })
      // ]),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
          _buildYourOwnTests(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xff1E3163),
          // borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(40.0),
          //   bottomRight: Radius.circular(40.0),
          // )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Are you feeling sick?',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                CountryDropdown(
                  countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                  country: _country,
                  onChanged: (val) => setState(() => _country = val),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you '
                      'feel sick with any COVID-19 symptoms, please call or text '
                      'us for help',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    FlatButton.icon(
                      label: Text(
                        'Call Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => launch("tel:0509497700"),
                      icon: const Icon(Icons.phone, color: Colors.white),
                      color: Color(0xffFF4C29),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    SizedBox(width: 10),
                    FlatButton.icon(
                      label: Text(
                        'SMS',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xffFF4C29),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () => launch("sms:0509497700"),
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prevention Tips',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Image.asset(
                    'assets/images/mask.png',
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: 12),
                  Text('Wear a mask')
                ]),
                Column(children: [
                  Image.asset(
                    'assets/images/distance.png',
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: 12),
                  Text('Keep your distance')
                ]),
                Column(children: [
                  Image.asset(
                    'assets/images/wash_hands.png',
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: 12),
                  Text('Wash your hands')
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () => launch('https://ghs.gov.gh/covid19/'),
        child:Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          height: screenHeight * 0.15,
          decoration: BoxDecoration(
            gradient:
            LinearGradient(colors: [Color(0xffEEEEEE), Color(0xff1E3163)]),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/own_test.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ghana Website',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Ghana outbreak response\nmanagement updates',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),);
  }

  SliverToBoxAdapter _buildYourOwnTests(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      NewsPage()));
        },
        child:Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          height: screenHeight * 0.15,
          decoration: BoxDecoration(
            gradient:
            LinearGradient(colors: [Color(0xffEEEEEE), Color(0xff1E3163)]),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/own_test.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Find latest news on \nCovid-19',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Any news about what is \nhappening around the world',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),);
  }
} //

//PAGE 2
class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Page 2"), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Page2()));
              })
        ]),
        body: Center(
            child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListViewPage()));
                },
                child: Text("Switch Page - Leave a Like"))));
  }
}

//PAGE 3
class Page3 extends StatefulWidget {
  const Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0xFF1E3163),
          title: Text("Guide"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Page2()));
                })
          ]),
      body: HomeCategories(),
    );
  }
}

//PAGE 4
class Page4 extends StatefulWidget {
  const Page4({Key key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1E3163),
          title: Text("Account"),
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  ProfilePic(),
                  SizedBox(height: 20),
                  ProfileMenu(
                    text: "My Profile",
                    icon: "assets/icons/User Icon.svg",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  profilePage()));
                    },
                  ),
                  ProfileMenu(
                    text: "Notifications",
                    icon: "assets/icons/Bell.svg",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  notificationsPage()));
                    },
                  ),
                  ProfileMenu(
                    text: "Settings",
                    icon: "assets/icons/Settings.svg",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SettingsPage()));
                    },
                  ),
                  ProfileMenu(
                    text: "Help Center",
                    icon: "assets/icons/Question mark.svg",
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    icon: "assets/icons/Log out.svg",
                    press: () {
                      auth.signOut();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Splash()));
                    },
                  ),
                ],
              ),
            )));
  }
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
              leading: Text("$index"), title: Text("Number $index"));
        },
      ),
    );
  }
}
