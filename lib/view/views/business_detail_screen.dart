import 'package:flutter/material.dart';
import 'package:geny_labs_test/model/business_model.dart';

class BusinessDetailScreen extends StatelessWidget {
  final BusinessModel business;
  const BusinessDetailScreen({required this.business, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          business.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location: ${business.location}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Phone: ${business.phone}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
