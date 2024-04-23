import 'package:flutter_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListNotifier extends StateNotifier<List<Place>> {
  PlacesListNotifier() : super(const []);

  void addPlace(Place place) {
    if (!state.contains(place)) {
      final newPlace = Place(name: place.name, image: place.image);
      state = [newPlace, ...state];
    }
  }

  void removePlace(Place place) {
    if (state.contains(place)) {
      state = state.where((placeItem) => place.id != placeItem.id).toList();
    }
  }
}

final placesListProvider =
    StateNotifierProvider<PlacesListNotifier, List<Place>>(
        (ref) => PlacesListNotifier());
