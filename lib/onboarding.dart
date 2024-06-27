import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/login.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> _onboardingData = CashHelper.getData(key: "lang")=="en" ? [
    {
      "image": "assets/images/on1.png",
      "title": "Check the health of your Wheat",
      "description": "check if your wheat is infected and get info about the Disease and how to deal with it."
    },
    {
      "image": "assets/images/on3.png",
      "title": "Easy And Simple Trading!",
      "description": "Sell and buy wheat or medicine with Ease "
    },
    {
      "image": "assets/images/on2.png",
      "title": "Keep in Touch with Wheat News",
      "description": "get all news about wheat and planting tips that will help you alot."
    },
    {
      "image": "assets/images/on4.png",
      "title": "Start Your Journey Today!",
      "description": ""
    },
  ] :[
    {
      "image": "assets/images/on1.png",
      "title": "التحقق من صحة القمح الخاص بك",
      "description": "تحقق مما إذا كان قمحك مصابًا واحصل على معلومات حول المرض وكيفية التعامل معه."
    },
    {
      "image": "assets/images/on3.png",
      "title": "بيع سهل و بسيط !",
      "description": "بيع واشتري القمح والدواء بكل سهولة "
    },
    {
      "image": "assets/images/on2.png",
      "title": "تابع أخبار القمح بإستمرار",
      "description": "احصل على جميع الأخبار حول القمح ونصائح الزراعة التي ستساعدك كثيرًا."
    },
    {
      "image": "assets/images/on4.png",
      "title": "إبدأ رحلتك الأن",
      "description": ""
    },
  ] ;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) => OnboardingContent(
              image: _onboardingData[index]["image"]!,
              title: _onboardingData[index]["title"]!,
              description: _onboardingData[index]["description"]!,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 5,
            right: 16,
            child: TextButton(
              onPressed: () {
                navigateAndClear(context, loginScreen());
                CashHelper.setData(key: "onboarding", value: "false");

              },
              child: Text(S.of(context).skip, style: TextStyle(color: Colors.white)),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _onboardingData.length,
                        (index) => Container(
                      margin: EdgeInsets.only(right: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    if (_currentPage > 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(Icons.arrow_back, color: Colors.green),
                      ),
                    TextButton(
                      onPressed: () {
                        if (_currentPage == _onboardingData.length - 1) {
                          navigateAndClear(context, loginScreen());
                          CashHelper.setData(key: "onboarding", value: "false");
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Icon(Icons.arrow_forward, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: CustomPaint(
                      painter: DiagonalPainter(),
                      child: Container(height: screenHeight * 0.55),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      image,
                      height: screenHeight * 0.4,
                      width: screenWidth * 0.8,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.green;
    Path path = Path();

    path.lineTo(0, size.height * 0.7);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
