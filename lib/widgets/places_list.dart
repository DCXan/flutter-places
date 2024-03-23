import 'package:flutter/material.dart';
import 'package:flutter_places/models/place.dart';
import 'package:flutter_places/widgets/list_item.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        var place = places[index];
        return ListItem(
          place: place,
        );
      },
    );
  }
}
