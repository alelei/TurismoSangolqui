import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final images = [
    {'image': 'images/Atractivos.jpg', 'title': 'image 1'},
    {'image': 'images/Acerca.jpg', 'title': 'image 2'},
    {'image': 'images/Lugares.jpg', 'title': 'image 3'}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ListView.builder(
            itemCount: images.length,
            itemBuilder: (_, i) => Row(
              children: [
                Image.asset(
                  images[i]['image'] ?? '',
                  width: 200,
                ),
                Text(images[i]['title'] ?? '')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// final images = [
//     {'image': 'images/Atractivos.jpg', 'title': 'image 1'},
//     {'image': 'images/Acerca.jpg', 'title': 'image 2'},
//     {'image': 'images/Lugares.jpg', 'title': 'image 3'}
//   ];
