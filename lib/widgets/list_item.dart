import 'package:flutter/material.dart';
import 'package:flutter_places/models/place.dart';
import 'package:flutter_places/screens/place_detail.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => PlaceDetailScreen(place: place)),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(place.image),
        ),
        title: Text(
          place.name,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
