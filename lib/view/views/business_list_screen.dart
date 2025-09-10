import 'package:flutter/material.dart';
import 'package:geny_labs_test/model/business_model.dart';
import 'package:geny_labs_test/provider/business_provider.dart';
import 'package:geny_labs_test/view/views/business_detail_screen.dart';
import 'package:geny_labs_test/view/widgets/service_card.dart';
import 'package:provider/provider.dart';

class BusinessListScreen extends StatelessWidget {
  const BusinessListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Businesses')),
      body: Consumer<BusinessProvider>(
        builder: (context, provider, _) {
          switch (provider.status) {
            case BusinessStateStatus.loading:
              return Center(child: CircularProgressIndicator());
            case BusinessStateStatus.empty:
              return Center(child: Text('No businesses found'));
            case BusinessStateStatus.error:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${provider.errorMessage}'),
                    ElevatedButton(
                      onPressed: () => provider.loadBusinesses(),
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            case BusinessStateStatus.loaded:
              return ListView.builder(
                itemCount: provider.businesses.length,
                itemBuilder: (context, index) {
                  final biz = provider.businesses[index];
                  return GenericCard<BusinessModel>(
                    item: biz,
                    builder:
                        (b) => Card(
                          child: ListTile(
                            title: Text(b.name),
                            subtitle: Text(b.location),
                            trailing: Text(b.phone),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => BusinessDetailScreen(business: b),
                                ),
                              );
                            },
                          ),
                        ),
                  );
                },
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
