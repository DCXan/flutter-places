import 'package:flutter/material.dart';
import 'package:flutter_places/models/place.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
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
