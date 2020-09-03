import 'package:flutter/material.dart';
import 'package:hka_ree_warr/main.dart';
import 'package:hka_ree_warr/models/language.dart';
import 'package:hka_ree_warr/pages/come_soon_page.dart';
import 'package:hka_ree_warr/pages/home_page.dart';
import 'package:hka_ree_warr/pages/search_page.dart';
import 'package:hka_ree_warr/themes/light_color.dart';
import 'package:hka_ree_warr/themes/theme.dart';
import 'package:hka_ree_warr/widgets/extensions.dart';

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

  Widget _icon(IconData icon, {Color color = DarkColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  @override
  Widget build(BuildContext context) {
    void onLanguageChange(Language language) {
      Locale _temp;
      switch (language.countryCode) {
        case 'en':
          _temp = Locale(language.countryCode, 'US');
          break;
        case 'my':
          _temp = Locale(language.countryCode, 'MM');
          break;

        default:
          _temp = Locale(language.countryCode, 'US');
      }

      MyApp.setLanguage(context, _temp);
    }

    Widget _appBar() {
      return Container(
        padding: AppTheme.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RotatedBox(
              quarterTurns: 4,
              child: _icon(Icons.sort, color: Colors.black54),
            ),
            DropdownButton(
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.black54,
                ),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                        (language) => DropdownMenuItem(
                            value: language,
                            child: Row(
                              children: [
                                Text(language.flag),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(language.name),
                              ],
                            )))
                    .toList(),
                onChanged: (language) {
                  onLanguageChange(language);
                }),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _appBar(),
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
        ),
      ),
    );
  }
}
