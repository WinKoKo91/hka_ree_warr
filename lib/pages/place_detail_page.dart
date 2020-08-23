import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hka_ree_warr/themes/theme.dart';
import 'package:hka_ree_warr/widgets/extensions.dart';
import 'package:hka_ree_warr/widgets/gallery_image.dart';

class PlaceDetailPage extends StatefulWidget {
  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  List<String> galleries = [];

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));

    galleries = ["assets/mdy.jpg", "assets/mdy2.jpg"];

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _backicon() {
      return Positioned(
          child: Container(
        padding: EdgeInsets.only(top: 24, right: 24),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ));
    }

    Widget _appBar() {
      return Container(
        height: 320,
        child: Stack(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28)),
                child: Image.asset(
                  'assets/mdy2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 30,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: AppTheme.lightTheme.backgroundColor,
                    boxShadow: AppTheme.favoriteShadow),
                child: Icon(
                  Icons.favorite,
                  color: Color(0xffFF8D8F),
                ),
              ).ripple(() {},
                  borderRadius: BorderRadius.all(Radius.circular(13))),
            ),
          ],
        ),
      );
    }

    Widget _content() {
      return Container(
        padding: AppTheme.hPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.subtitle1,
                    children: [
                      WidgetSpan(
                          child: Container(
                        padding: const EdgeInsets.only(right: 6, bottom: 2),
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.black54,
                          size: 12,
                        ),
                      )),
                      TextSpan(
                        text: '5-7 days',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                RichText(

                  text: TextSpan(
                    style: Theme.of(context).textTheme.subtitle1,
                    children: [
                      WidgetSpan(
                          child: Container(
                        padding: const EdgeInsets.only(right: 4,bottom: 2),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.black54,
                          size: 12,
                        ),
                      )),
                      TextSpan(
                        text: "22 km",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Mandalay - Royal Capital",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Description Mandalay is a city and former royal capital in northern Myanmar (formerly Burma) on the Irrawaddy River.",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.5),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Travel's Gallery",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 25, crossAxisSpacing: 25),
              itemBuilder: (context, index) {
                return GalleryImageItem(galleries[index]);
              },
              itemCount: galleries.length,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }

    Widget _body() {
      return Container(
        height: AppTheme.fullHeight(context) - 70,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appBar(),
              _content(),
            ],
          ),
        ),
      );
    }

    Widget _bottom() {
      return Container(
        width: AppTheme.fullWidth(context),
        color: Color(0xffFF8D8F),
        height: 70,
        child: Container(
          padding: AppTheme.hPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Average Cost",
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("350 \$",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Book a Tour"),
                textColor: Color(0xffFF8D8F),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          height: AppTheme.fullHeight(context),
          child: Stack(
            children: [
              _body(),
              _backicon(),
              Positioned(
                bottom: 0,
                child: _bottom(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
