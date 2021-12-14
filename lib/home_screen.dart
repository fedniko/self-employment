import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          key: _globalKey,
          appBar: AppBar(
            title: const Text(
              "Главная",
            ),
          ),
          body: RefreshIndicator(
            color: Theme.of(context).colorScheme.secondary,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));

              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (a, b, c) => const HomeScreen(),
                      transitionDuration: const Duration(seconds: 0)));

              return Future.value();
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: const [
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () {
          if (_globalKey.currentState!.isDrawerOpen) {
            Navigator.pop(context);
            return Future.value(false);
          } else {
            return onWillPop(context);
          }
        });
  }

  Future<bool> onWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Нажмите еще раз для выхода',
        ),
        duration: Duration(seconds: 2),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DateTime>(
        'currentBackPressTime', currentBackPressTime));
  }
}
