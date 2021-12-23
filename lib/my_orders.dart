import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class OrderList {
  String? title;
  String? price;
  String? date;
  String? status;
  String? content;

  OrderList(
      {this.title, this.price, this.date, this.status, this.content});
}

class MyOrdersWidget extends StatelessWidget {
  MyOrdersWidget({Key? key}) : super(key: key);

  final order = <OrderList>[
    OrderList(
        title: 'Сделать макет приложения',
        price: '30000₽',
        date: '23.12.2021',
        status: 'loading',
        content: 'Hello world!'),
    OrderList(
        title: 'Оцифровать книгу',
        price: '4500₽',
        date: '15.12.2021',
        status: 'success',
        content: 'Hello world!'),
    OrderList(
        title: 'Сделать рассылку',
        price: '5000₽',
        date: '01.12.2021',
        status: 'fail',
        content: 'Hello world!'),
    OrderList(
        title: 'Сделать ТЗ',
        price: '20000₽',
        date: '28.11.2021',
        status: 'success',
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
                  order[i].date!,
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
                        builder: (context) => myOrderItem(context, order[i])),
                  );
                },
              ),
            );
          }),
    );
  }
}

Widget leading(BuildContext context, OrderList orderList) {
  var icon = 'assets/images/status_inProgress.svg';
  switch (orderList.status) {
    case 'success':
      icon = 'assets/images/status_success.svg';
      break;
    case 'fail':
      icon = 'assets/images/status_fail.svg';
      break;
    case 'loading':
      icon = 'assets/images/status_inProgress.svg';
      break;
  }

  return SvgPicture.asset(
    icon,
    height: 30,
    width: 30,
  );
}

Widget myOrderItem(BuildContext context, OrderList orderList) {
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
