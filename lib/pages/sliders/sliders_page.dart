import 'dart:math';

import 'package:designs/pages/sliders/models/slider1_model.dart';
import 'package:designs/pages/sliders/slider_detail_page.dart';
import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  @override
  State<SlidersPage> createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  /**
  * variables para el segundo pageView
  */
  final PageController _pageController2 = PageController(
    viewportFraction: 0.8,
  );
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController2.page!;
    });
  }

  @override
  void initState() {
    _pageController2.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.removeListener(_listener);
    _pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Carrousel simple',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listSlider1.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, animation, __) => FadeTransition(
                        opacity: animation,
                        child: SliderDetailPage(
                          data: listSlider1[index],
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _Cards(
                    model: listSlider1[index],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Carrousel con una animación',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController2,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listSlider1.length,
              itemBuilder: (context, index) {
                final data = listSlider1[index];
                final porcentaje = _currentPage - index;
                final value = porcentaje.clamp(0.0, 1.0);
                print(value);
                return Opacity(
                  opacity: 1 - value,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..scale(1 - value)
                      ..rotateY(pi * value),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Container(
                                color: Colors.grey,
                                width: double.infinity,
                                height: double.infinity,
                                child: Image.network(
                                  data.imageUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, chunk) {
                                    if (chunk != null) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return child;
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
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
                                          overflow: TextOverflow.ellipsis),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  final Slider1Model model;
  _Cards({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            height: double.infinity,
            child: Hero(
              tag: model.imageUrl,
              child: Image.network(
                model.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, chunk) {
                  if (chunk != null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return child;
                },
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: ShapeDecoration(
              color: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Text(
                  model.rating.toString(),
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                model.rating > 0
                    ? const Icon(Icons.star, color: Colors.yellow)
                    : const Icon(Icons.star_outline, color: Colors.white),
                model.rating > 1
                    ? const Icon(Icons.star, color: Colors.yellow)
                    : const Icon(Icons.star_outline, color: Colors.white),
                model.rating > 2
                    ? const Icon(Icons.star, color: Colors.yellow)
                    : const Icon(Icons.star_outline, color: Colors.white),
                model.rating > 3
                    ? const Icon(Icons.star, color: Colors.yellow)
                    : const Icon(Icons.star_outline, color: Colors.white),
                model.rating > 4
                    ? const Icon(Icons.star, color: Colors.yellow)
                    : const Icon(Icons.star_outline, color: Colors.white),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: 0,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
                Text(
                  model.subtitle,
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
      ],
    );
  }
}
