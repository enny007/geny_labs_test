import 'package:flutter/material.dart';
import 'package:geny_labs_test/http/dio_client.dart';
import 'package:geny_labs_test/provider/business_provider.dart';
import 'package:geny_labs_test/view/views/business_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  final api = DioClient.getInstance();
  runApp(MainApp(api: api));
}

class MainApp extends StatelessWidget {
  final DioClient api;

  const MainApp({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BusinessProvider(api)..loadBusinesses(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BusinessListScreen(),
      ),
    );
  }
}
