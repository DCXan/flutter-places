import 'package:flutter/material.dart';
import 'package:flutter_places/models/place.dart';
import 'package:flutter_places/providers/places_list_provider.dart';
import 'package:flutter_places/widgets/image_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class NewItemScreen extends ConsumerStatefulWidget {
  const NewItemScreen({super.key});

  @override
  ConsumerState<NewItemScreen> createState() => __NewItemState();
}

class __NewItemState extends ConsumerState<NewItemScreen> {
  final _titleController = TextEditingController();

  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }

    ref.watch(placesListProvider.notifier).addPlace(
          Place(name: enteredTitle, image: _selectedImage!),
        );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
