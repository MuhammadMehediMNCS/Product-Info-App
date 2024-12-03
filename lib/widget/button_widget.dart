import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.indigo,
      minimumSize: const Size(300.0, 60.0),
      shape: const StadiumBorder(),
      side: const BorderSide(color: Colors.black)
    ),
    child: Text(
      title,
      style: const TextStyle(
        fontFamily: 'TiroBangla-Regular',
        fontSize: 24,
        color: Colors.white
      ),
    )
  );
}