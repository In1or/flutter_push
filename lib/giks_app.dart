import 'package:flutter/material.dart';

import 'features/admin_page/admin_page.dart';

class GiksApp extends StatelessWidget {
  const GiksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: AdminPageWidget(),
      ),
    );
  }
}
