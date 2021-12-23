import 'package:flutter/material.dart';

// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class OrderList {
  String? title;
  String? price;
  String? address;
  String? category;
  String? content;

  OrderList(
      {this.title, this.price, this.address, this.category, this.content});
}

class OrderListWidget extends StatelessWidget {
  OrderListWidget({Key? key}) : super(key: key);

  final order = <OrderList>[
    OrderList(
        title: 'Погулять с собакой',
        price: '1000₽',
        address: 'г. Якутск, ул. Кулаковского 48',
        category: 'pets',
        content: 'Hello world!'),
    OrderList(
        title: 'Заменить воздушный фильтр',
        price: '3000₽',
        address: 'г. Якутск, ул. Хабарова 12',
        category: 'car',
        content: 'Hello world!'),
    OrderList(
        title: 'Установить ОС',
        price: '2500₽',
        address: 'г. Якутск, ул. Ленина 1',
        category: 'computer',
        content: 'Hello world!'),
    OrderList(
        title: 'Убрать в квартире',
        price: '2300₽',
        address: 'г. Якутск, ул. Дзержинского 4/1',
        category: 'cleaning',
        content: 'Hello world!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: order.length,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(228, 228, 228, 0.6)))),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    leading(context, order[i]),
                  ],
                ),
                minLeadingWidth: 30,
                title: Text(
                  order[i].title!,
                  style: const TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  order[i].address!,
                  style: const TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                trailing: Text(
                  order[i].price!,
                  style: const TextStyle(
                    color: Color(0xff999999),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                isThreeLine: false,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => orderItem(context, order[i])),
                  );
                },
              ),
            );
          }),
    );
  }
}

Widget leading(BuildContext context, OrderList orderList) {
  var icon = 'assets/images/cat1.svg';
  switch (orderList.category) {
    case 'fav':
      icon = 'assets/images/cat1.svg';
      break;
    case 'repair':
      icon = 'assets/images/cat2.svg';
      break;
    case 'car':
      icon = 'assets/images/cat3.svg';
      break;
    case 'pets':
      icon = 'assets/images/cat4.svg';
      break;
    case 'computer':
      icon = 'assets/images/cat5.svg';
      break;
    case 'cleaning':
      icon = 'assets/images/cat6.svg';
      break;
    case 'strong':
      icon = 'assets/images/cat7.svg';
      break;
  }

  return SvgPicture.asset(
    icon,
    height: 30,
    width: 30,
  );
}

Widget orderItem(BuildContext context, OrderList orderList) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        "Детали заказа",
      ),
    ),
    body: SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading(context, orderList),
              ],
            ),
            minLeadingWidth: 15,
            title: Text(
              orderList.title!,
              style: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Text(
              orderList.price!,
              style: const TextStyle(
                color: Color(0xff999999),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Text(
            orderList.content!,
            style: const TextStyle(
              color: Color(0xff999999),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    )),
  );
}
