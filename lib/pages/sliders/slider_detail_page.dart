import 'package:designs/pages/sliders/models/slider1_model.dart';
import 'package:flutter/material.dart';

class SliderDetailPage extends StatelessWidget {
  final Slider1Model data;

  const SliderDetailPage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.width,
                child: Hero(
                  tag: data.imageUrl,
                  child: Image.network(
                    data.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                left: 10,
                top: 10,
                child: BackButton(),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: ShapeDecoration(
                    color: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        data.rating.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      data.rating > 0
                          ? const Icon(Icons.star, color: Colors.yellow)
                          : const Icon(Icons.star_outline, color: Colors.white),
                      data.rating > 1
                          ? const Icon(Icons.star, color: Colors.yellow)
                          : const Icon(Icons.star_outline, color: Colors.white),
                      data.rating > 2
                          ? const Icon(Icons.star, color: Colors.yellow)
                          : const Icon(Icons.star_outline, color: Colors.white),
                      data.rating > 3
                          ? const Icon(Icons.star, color: Colors.yellow)
                          : const Icon(Icons.star_outline, color: Colors.white),
                      data.rating > 4
                          ? const Icon(Icons.star, color: Colors.yellow)
                          : const Icon(Icons.star_outline, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                child: Container(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          data.subtitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Transform.translate(
                  offset: const Offset(0, 1),
                  child: Container(
                    width: size.width,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
