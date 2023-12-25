import 'package:flutter/material.dart';

Widget searchStyle() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: const Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 5,
            ),
            Text(
              'Search product',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
