import 'package:flutter/material.dart';
import 'package:task_manager_and_weather/resources/AppTextStyle.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;


  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      padding: const EdgeInsets.all(15),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.h2,),

      ),
    );
  }

}