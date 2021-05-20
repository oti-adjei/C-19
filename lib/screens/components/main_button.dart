import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MainButton extends StatelessWidget {
  const MainButton({
    Key key,
    @required this.tapEvent
  }) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: tapEvent,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)
      ),
      child: Container(
        width: (150 / 414) * size.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
            ),
            color: Color(0XFF4F80C8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),

            SizedBox(width: 20.0),

            SvgPicture.asset('assets/icons/next.svg')
          ],
        ),
      ),
    );
  }
}