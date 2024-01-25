import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget {
  final Widget body;

  const AppAppBar({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _goBack(context),
          icon: const Icon(Icons.chevron_left_sharp),
        ),
      ),
      body: body,
    );
  }

  _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

}
