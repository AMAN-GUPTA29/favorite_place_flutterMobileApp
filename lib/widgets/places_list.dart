import 'package:flutter/material.dart';
import 'package:favorite_place/models/places.dart';
import 'package:favorite_place/screens/placedetail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  void _openPlace(BuildContext context, Place openPlace) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PlaceDetailScreen(
              place: openPlace,
            )));
  }

  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('No places added yet',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      );
    } else {
      return ListView.builder(
        itemCount: places.length,
        itemBuilder: ((ctx, index) => InkWell(
              onTap: () {
                _openPlace(context, places[index]);
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: FileImage(places[index].image),
                ),
                title: Text(
                  places[index].place,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  places[index].location.address,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            )),
      );
    }
  }
}
