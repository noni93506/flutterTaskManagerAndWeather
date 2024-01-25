import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar({
    required Function(int) onAction,
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.black87,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          dismissDirection: DismissDirection.down,
          duration: const Duration(days: 1),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          content: _Content(
            onAction: onAction,
          ),
        );
}

class _Content extends StatelessWidget {
  final Function(int) onAction;

  const _Content({
    required this.onAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              onAction(0);
            },
            child: const Icon(Icons.work, color: Colors.white,),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              onAction(1);
            },
            child: const Icon(Icons.person , color: Colors.white,),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              onAction(2);
            },
            child: const Icon(Icons.sports_basketball, color: Colors.white,),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              onAction(9);
            },
            child: const Icon(Icons.cancel, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
