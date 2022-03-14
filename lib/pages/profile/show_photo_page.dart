import 'package:designs/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class ShowPhotoPage extends StatelessWidget {
  final Story photo;

  const ShowPhotoPage({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Hero(
                tag: photo.image.toString(),
                child: Image(
                  image: NetworkImage(photo.image),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
