import 'package:flutter/material.dart';

import 'package:food_ordering_app/data/data.dart';
import 'package:food_ordering_app/screens/recent_order.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.person,
                size: 25,
              )),
        ),
        title: const Text("Food Delivery App"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("Cart (${currentUser.cart?.length})",
                  style: TextStyle(color: Colors.white, fontSize: 20)))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: searchController.clear,
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          RecentOrder(),
        ]),
      ),
    );
  }
}
