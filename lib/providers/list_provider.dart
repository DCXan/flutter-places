import 'package:flutter_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListNotifier extends StateNotifier<List<Place>> {
  PlacesListNotifier() : super([]);

  void addPlace(Place place) {
    if (!state.contains(place)) {
      state = [...state, place];
    }
  }
}

final placesListProvider =
    StateNotifierProvider<PlacesListNotifier, List<Place>>(
        (ref) => PlacesListNotifier());
