import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    required this.tittle,
    super.key,
  });
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              tittle,
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
