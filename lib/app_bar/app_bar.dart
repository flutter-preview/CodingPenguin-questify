import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize:  MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
            ),
            const Text(
              'Joy',
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 24)
            ),
          ],
        ),

      ],
    );
  }
}