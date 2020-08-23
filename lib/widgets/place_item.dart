import 'package:flutter/material.dart';
import 'package:hka_ree_warr/models/place.dart';
import 'package:hka_ree_warr/widgets/extensions.dart';

class PlaceItem extends StatelessWidget {
  final Place place;
  final Function onTap;

  PlaceItem({this.place, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            place.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              gradient: LinearGradient(
                colors: [
                  Color(0xff000000),
                  Color(0x30000000),
                  Color(0x00000000),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade400,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.subtitle1,
                        children: [
                          WidgetSpan(
                              child: Container(
                            padding: const EdgeInsets.only(right: 4, bottom: 1),
                            child: Icon(
                              Icons.calendar_today,
                              size: 14,
                            ),
                          )),
                          TextSpan(
                            text: place.date,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.subtitle1,
                        children: [
                          WidgetSpan(
                              child: Container(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.location_on,
                              size: 14,
                            ),
                          )),
                          TextSpan(
                            text: place.distance,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ).ripple(onTap, borderRadius: BorderRadius.all(Radius.circular(13)));
  }
}
