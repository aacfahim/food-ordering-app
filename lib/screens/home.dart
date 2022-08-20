import 'package:flutter/material.dart';
import 'package:food_ordering_app/data/data.dart';
import 'package:food_ordering_app/models/restaurant.dart';
import 'package:food_ordering_app/screens/recent_order.dart';
import 'package:food_ordering_app/screens/restaurant_screen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  buildRestaurants() {
    List<Widget> restaurantList = [];

    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantScreen(restaurant)),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Image(
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    image: AssetImage("${restaurant.imageUrl}")),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${restaurant.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text("${restaurant.address}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("Rating: ${restaurant.rating}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            )
          ]),
        ),
      ));
    });

    return Column(children: restaurantList);
  }

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: searchController.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            RecentOrder(),
            Column(
              children: [
                Text("Near Me Restuarants",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 8),
                buildRestaurants(),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
