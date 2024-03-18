import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidgets extends StatefulWidget {
  const CarouselWidgets({Key? key}) : super(key: key);

  @override
  State<CarouselWidgets> createState() => _CarouselWidgetsState();
}

class _CarouselWidgetsState extends State<CarouselWidgets> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<String> list = [
    'https://p1.ssl.qhimg.com/t01683f3a068943c2e3.png',
    'https://p1.ssl.qhimg.com/t01e9ee778759020ddb.png',
    'https://p1.ssl.qhimg.com/t01f7dfb7391d1f1de2.jpg',
    'https://p1.ssl.qhimg.com/t01aa65ca167724f2c9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return GestureDetector(
              onTap: () {
                print("click the carousel");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // 通过矩形裁剪组件，设置圆角半径
                child: Image.network(list[index], fit: BoxFit.cover)),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

