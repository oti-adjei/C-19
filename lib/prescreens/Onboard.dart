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
        title: "Fractional shares",
        body:
        "Instead of having to buy an entire share, invest any amount you want.",
        image: _buildImage('img1.jpg'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Learn as you go",
        body:
        "Download the Stockpile app and master the market with our mini-lesson.",
        image: _buildImage('img2.jpg'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Kids and teens",
        body:
        "Kids and teens can track their stocks 24/7 and place trades that you approve.",
        image: _buildImage('img3.jpg'),
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
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }
}


// the HOme page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}