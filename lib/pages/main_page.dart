import 'package:flutter/material.dart';
import 'package:hka_ree_warr/main.dart';
import 'package:hka_ree_warr/models/language.dart';
import 'package:hka_ree_warr/pages/come_soon_page.dart';
import 'package:hka_ree_warr/pages/home_page.dart';
import 'package:hka_ree_warr/pages/search_page.dart';
import 'package:hka_ree_warr/themes/light_color.dart';
import 'package:hka_ree_warr/themes/theme.dart';
import 'package:hka_ree_warr/widgets/extensions.dart';

import 'setting_page.dart';

class MainPage extends StatefulWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHome = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _selectedPage() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
        break;
      case 1:
        return ComeSoonPage();
        break;
      case 2:
        return ComeSoonPage();
        break;
      case 3:
        return ComeSoonPage();
        break;
    }
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(0)));
  }

  @override
  Widget build(BuildContext context) {
    Widget _appBar() {
      return AppBar(
        elevation: 0,
        leading: Center(
          child: IconButton(
            icon: Icon(Icons.sort,),
            onPressed: () {},
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                SettingPage.show(context);
              }),
        ],
      );
    }

    Widget _buildBottomNavigationBar() {
      return BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        unselectedIconTheme: Theme.of(context).iconTheme ,
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      );
    }

    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              switchInCurve: Curves.easeInToLinear,
              switchOutCurve: Curves.easeOutBack,
              child: _selectedPage(),
            ),
          ),
        ],
      ),
    );
  }
}
