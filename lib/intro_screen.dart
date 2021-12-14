import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => HomeScreen()));
    } else {
      // Раскомментировать при билде
      // await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => const IntroScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Загрузка...'),
      ),
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.width * 0.003;
    double multiplier = 16;

    return Scaffold(
        body: IntroductionScreen(
      rawPages: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: SvgPicture.asset(
                "assets/images/intro1.svg",
              ),
            ),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const Text('Добро пожаловать!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 28)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Наше приложение создано для того, чтобы помочь вам быстро найти работу или исполнителей ваших заказов',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: multiplier * unitHeightValue,
                              color: const Color(0xff999999))),
                    ],
                  ),
                ))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: SvgPicture.asset(
                "assets/images/intro2.svg",
              ),
            ),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const Text('Легальный бизнес',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 28)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Наше приложение позволяет легально вести бизнес и получать стабильный доход без рисков',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: multiplier * unitHeightValue,
                              color: const Color(0xff999999))),
                    ],
                  ),
                )),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: SvgPicture.asset(
                "assets/images/loginScreen.svg",
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const Text('Уведомления',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 28)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Разрешите отправку PUSH-уведомлений, чтобы не пропустить ответа от заказчика или исполнителя',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: multiplier * unitHeightValue,
                            color: const Color(0xff999999))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => HomeScreen()),
        );
      },
      onSkip: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => HomeScreen()),
        );
      },
      showSkipButton: true,
      skip: const Text(
        'Пропустить',
        style: TextStyle(color: Color(0xff29323D)),
      ),
      next: const Text(
        'Далее',
        style: TextStyle(color: Color(0xff29323D)),
      ),
      done: const Text("Готово",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xff29323D))),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: const Color(0xffE4E4E4),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}
