import 'package:c19app/prescreens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final introdate= GetStorage();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Splash()),
    );
    introdate.write("displayed", true);
  }
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }
  static const bodyStyle = TextStyle(fontSize: 19.0);
  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: bodyStyle,
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Wear Mask",
        body:
        "Wearing a face mask correctly can help prevent the spread of Covid-19 to others.",
        image: _buildImage('img1.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Use Sanitizers",
        body:
        "Use hand sanitizers after entering public places and generally any activity..",
        image: _buildImage('img2.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Wash Hands",
        body: " Washing your hands can protect you and your loved ones.",
        image: _buildImage('img3.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Another title page",
        body: "Another beautiful body text for this example onboarding",
        image: _buildImage('img2.jpg'),
        decoration: pageDecoration,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      //key: introKey, This initializes the key for your button
      globalBackgroundColor: Colors.white,

      //create the space  at the top  so that the picture is not against the top
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),

      //create the space beneath the buttons below
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
      ),


      pages: getPages(),
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text(
        'Skip',
        style: TextStyle(color: const Color(0xffFF4C29)),
      ),
      next: const Icon(Icons.arrow_forward, color: const Color(0xffFF4C29)),
      done: const Text(
        'Done',
        style: TextStyle(
            fontWeight: FontWeight.w600, color: const Color(0xffFF4C29)),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: DotsDecorator(
        activeColor: Color(0xffFF4C29),
      ),
    );
  }
}



