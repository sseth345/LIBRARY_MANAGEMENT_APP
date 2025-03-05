import 'dart:async';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  final CarouselOptions options;
  final List<Widget> items;

  CarouselSlider({required this.options, required this.items});

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  late PageController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    if (widget.options.autoPlay) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.options.autoPlayInterval, (timer) {
      if (!_controller.hasClients) return;
      int nextPage = _controller.page!.toInt() + 1;
      if (nextPage >= widget.items.length && widget.options.enableInfiniteScroll) {
        nextPage = 0;
      }
      _controller.animateToPage(
        nextPage,
        duration: widget.options.autoPlayAnimationDuration,
        curve: widget.options.autoPlayCurve,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.options.height,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return widget.items[index];
        },
      ),
    );
  }
}

class CarouselOptions {
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final Curve autoPlayCurve;
  final bool enlargeCenterPage;
  final double aspectRatio;
  final bool enableInfiniteScroll; // Add this property

  CarouselOptions({
    required this.height,
    required this.autoPlay,
    required this.autoPlayInterval,
    required this.autoPlayAnimationDuration,
    required this.autoPlayCurve,
    required this.enlargeCenterPage,
    required this.aspectRatio,
    required this.enableInfiniteScroll, // Initialize it in the constructor
  });
}
