import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SliderContent extends StatelessWidget {
  const SliderContent({
    Key key,
    @required this.image,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  final String image, title, text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Spacer(),

        SvgPicture.asset(
          image,
          height: (270 / 896) * size.height, // 896 is width that designer used, 270 is height of the image that designer used
        ),

        Spacer(),

        Text(
          title,
          style: TextStyle(
              fontSize: 24,
              color: Color(0XFF364861),
              fontWeight: FontWeight.bold
          ),
        ),

        SizedBox(height: 20.0 / 2),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0 * 2),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0XFF374457),
                fontSize: 18
            ),
          ),
        )
      ],
    );
  }
}