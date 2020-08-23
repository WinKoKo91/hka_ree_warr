import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hka_ree_warr/models/place.dart';
import 'package:hka_ree_warr/widgets/place_item.dart';

class PlaceList extends StatelessWidget {
  final List<Place> places;

  PlaceList({this.places});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: places.length,
      itemBuilder: (BuildContext context, int index) {
        return PlaceItem(
          place: places[index],
          onTap: () {
            Navigator.of(context).pushNamed('/detail');
          },
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    );
  }
}
