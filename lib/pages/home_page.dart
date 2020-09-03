import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hka_ree_warr/lacalization/app_localization.dart';
import 'package:hka_ree_warr/lacalization/localization_constants.dart';
import 'package:hka_ree_warr/models/place.dart';
import 'package:hka_ree_warr/themes/theme.dart';
import 'package:hka_ree_warr/widgets/category_item.dart';
import 'package:hka_ree_warr/widgets/place_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _categoryList() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryItem(
            title: getTranslatedValue(context, 'category_hotel'),
            icon: Icons.hotel,
            color: Colors.green,
            backgroundColor: Colors.green.shade50,
          ),
          CategoryItem(
            title: getTranslatedValue(context, 'category_flight'),
            icon: Icons.flight,
            color: Colors.pink,
            backgroundColor: Colors.pink.shade50,
          ),
          CategoryItem(
            title: getTranslatedValue(context, 'category_food'),
            icon: Icons.restaurant,
            color: Colors.orange,
            backgroundColor: Colors.orange.shade50,
          ),
          CategoryItem(
            title: getTranslatedValue(context, 'category_event'),
            icon: Icons.calendar_today,
            color: Colors.indigo,
            backgroundColor: Colors.indigo.shade50,
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      padding: AppTheme.padding,
      child: RichText(
          text: new TextSpan(
        style: Theme.of(context).textTheme.headline4,
        children: [
          new TextSpan(
            text: getTranslatedValue(context, 'greeting_title'),
            style: GoogleFonts.padauk(
                textStyle: TextStyle(
                    color: Colors.pinkAccent.shade100,
                    fontWeight: FontWeight.w600)),
          ),
          new TextSpan(
              text: getTranslatedValue(context, 'greeting_desc'),
              style: GoogleFonts.padauk(
                  textStyle: TextStyle(color: Colors.black87))),
        ],
      )),
    );
  }

  List<Place> placeList;

  @override
  void initState() {
    placeList = [
      Place(
          image: 'assets/mdy2.jpg',
          name: 'Mandalay',
          date: '1-2 day',
          distance: "21km"),
      Place(
          image: 'assets/bagan.jpg',
          name: 'Bagan',
          date: '1-2 day',
          distance: "21km"),
      Place(
          image: 'assets/yangon.jpg',
          name: 'Yangon',
          date: '1-2 day',
          distance: "21km"),
      Place(
          image: 'assets/inle.jpg',
          name: 'Inle Lake',
          date: '1-4 day',
          distance: "21km"),
      Place(
          image: 'assets/mdy.jpg',
          name: 'Mandalay',
          date: '1-5 day',
          distance: "21km"),
      Place(
          image: 'assets/ygn3.jpg',
          name: 'Yangon',
          date: '1-2 day',
          distance: "21km"),
      Place(
          image: 'assets/yangon1.jpg',
          name: 'Yangon',
          date: '1-2 day',
          distance: "21km"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _title(),
            SizedBox(
              height: 4,
            ),
            _categoryList(),
            Container(
                padding: AppTheme.hPadding,
                child: Divider(
                  color: Colors.grey.shade300,
                )),
            Container(
              padding: AppTheme.padding,
              child: Text(
                getTranslatedValue(context, 'best_experience'),
                style: AppTheme.h1Style,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: AppTheme.hPadding,
              child: PlaceList(
                places: placeList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
