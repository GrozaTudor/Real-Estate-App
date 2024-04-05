import 'package:flutter/material.dart';
import 'package:workshop_arrk/models/house_model.dart'; // Import House model

class ItemDetailScreen extends StatelessWidget {
  final House house;
  final int imgPathIndex;

  const ItemDetailScreen({Key? key, required this.house, required this.imgPathIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: \$${house.price}'),
            Text('Address: ${house.address}'),
            Text('Bedrooms: ${house.bedrooms}'),
            Text('Bathrooms: ${house.bathrooms}'),
          ],
        ),
      ),
    );
  }
}
