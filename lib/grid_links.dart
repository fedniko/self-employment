import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Categories {
  String? title;
  String? picture;
  String? route;

  Categories({
    this.title,
    this.picture,
    this.route,
  });
}

class GridLinksWidget extends StatelessWidget {
  final categories = [
    Categories(
      title: 'Как стать самозанятым?',
      picture: 'assets/images/pic2.svg',
      route:
          'https://www.gosuslugi.ru/situation/kak_otkryt_svoe_delo/become_self-employed',
    ),
    Categories(
      title: 'Как начать зарабатывать?',
      picture: 'assets/images/pic7.svg',
      route: 'https://www.gosuslugi.ru/situation/kak_otkryt_svoe_delo/become_self-employed',
    ),
  ];

  GridLinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          margin: const EdgeInsets.only(bottom: 14),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
            ),
            itemBuilder: (context, i) {
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  launch(categories[i].route!);
                },
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfff9f9f9)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        categories[i].picture!,
                        width: 120,
                        alignment: Alignment.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        categories[i].title != null
                            ? categories[i].title!
                            : 'Текст отсутствует',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
