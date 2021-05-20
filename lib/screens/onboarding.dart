import 'package:flutter/material.dart';
import 'package:covid19_dashboard/screens/components/main_button.dart';
import 'package:covid19_dashboard/screens/components/skip_button.dart';
import 'package:covid19_dashboard/screens/components/slider_content.dart';
import 'package:flutter_svg/flutter_svg.dart';


const kPrimaryColor = Color(0XFF4F80C8);
class OnboardingScreen extends StatefulWidget {

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedSlider = 0;
  // Slider Data
  List<Map<String, String>> sliders = [
    {
      "title": "Meeting Online",
      "text": "Stay home and complete all of your importance work and meeting for keeping safe you and your family member",
      "image": "assets/images/slider1.svg"
    },
    {
      "title": "Wear a Mask",
      "text": "When you go outside of your home then obiously you have to wear a mask for keeping safe from covid-19",
      "image": "assets/images/slider2.svg"
    },
    {
      "title": "Social Distance",
      "text": "By maintaining social distance you can kep safe from other covid virus affected people and keep safe from covid-19",
      "image": "assets/images/slider3.svg"
    },
  ];

  PageController sliderController = PageController(initialPage: 0, keepPage: false);

  @override
  Widget build(BuildContext context) {
    void _profile() {
      Navigator.popAndPushNamed(context, "/booking");}
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        selectedSlider = index;
                      });
                    },
                    controller: sliderController,
                    itemCount: sliders.length,
                    itemBuilder: (context, index) => SliderContent(
                      image: sliders[index]['image'],
                      title: sliders[index]['title'],
                      text: sliders[index]['text'],
                    )
                ),
              ),

              SizedBox(height: 20.0),

              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sliders.length,
                            (index) => buildSliderNav(index: index),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          SkipButton(
                              tapEvent: () {}
                          ),

                          Spacer(),

                          MainButton(
                            tapEvent: () {
                              if (selectedSlider != (sliders.length - 1)) {
                                sliderController.animateToPage(selectedSlider + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                              }
                              else{
                                Navigator.popAndPushNamed(context, "/booking");
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildSliderNav({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: selectedSlider == index ? kPrimaryColor : Color(0xFFD7D7D7),
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}