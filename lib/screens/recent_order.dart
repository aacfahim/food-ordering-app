import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_ordering_app/data/data.dart';
import 'package:food_ordering_app/models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);

  buildRecentOrder(BuildContext context, Order order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.amber,
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
                height: double.infinity,
                width: 120,
                fit: BoxFit.cover,
                image: AssetImage("${order.food!.imageUrl}")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(children: [
                Text("${order.food!.name}"),
                Text("${order.restaurant!.name}"),
                Text("${order.food!.price} Tk"),
              ]),
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Recent Orders", style: TextStyle(fontSize: 30)),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders!.length,
            itemBuilder: (context, index) {
              Order order = currentUser.orders![index];
              return buildRecentOrder(context, order);
            },
          ),
        )
      ],
    );
  }
}
