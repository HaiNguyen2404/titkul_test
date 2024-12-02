import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  final AssetImage image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: buildIconButtonWidget,
    );
  }

  Widget get buildIconButtonWidget {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/titkul_logo.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
