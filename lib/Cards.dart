import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class NewCards extends StatelessWidget {
  final Color cardColor;
  final String topText;
  var bottomText;
  final double cardHeight;
  final double cardWidth;

  NewCards(this.cardColor, this.topText, this.bottomText, this.cardHeight,
      this.cardWidth);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: cardHeight,
      width: cardWidth,

      decoration: BoxDecoration(
      color: cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child:Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      topText,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    '$bottomText',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            )
          );
        }
      }

/*
*  Center(
                child: CustomToggleButtons(
                  renderBorder: false,
                  selectedColor: Colors.white,
                  onPressed: (index){
                    setState(() {
                      count = index;
                    });
                  },
                  children: [
                    Text(
                      days[0],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: count == 0 ? Colors.white: unselectedColor
                      ),
                    ),
                    Text(
                      days[1],
                      style: TextStyle(
                          color: count == 1 ? Colors.white: unselectedColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      days[2],
                      style: TextStyle(
                          color: count == 2 ? Colors.white: unselectedColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                  isSelected: [true,false,false],
                ),
              ),*/