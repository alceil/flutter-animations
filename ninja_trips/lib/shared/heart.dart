import 'dart:html';

import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _colorAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: IconButton(
        icon: Icon(
          Icons.favorite,
          color: _colorAnimation.value,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
