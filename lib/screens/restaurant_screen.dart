import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_ordering_app/models/restaurant.dart';

class RestaurantScreen extends StatelessWidget {
  RestaurantScreen(this.restaurant);
  Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Image(
            image: AssetImage("${restaurant.imageUrl}"),
            fit: BoxFit.cover,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${restaurant.name}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("${restaurant.address}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text("0.3 Miles", style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Review")),
              ElevatedButton(onPressed: () {}, child: Text("Contact")),
            ],
          ),
          Text("Menu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          Expanded(
            child: GridView.count(
                shrinkWrap: true,
                children: List.generate(restaurant.menu!.length, (index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "${restaurant.menu![index].imageUrl}")),
                      ),
                      Text("${restaurant.menu![index].name}",
                          style: TextStyle(fontSize: 20))
                    ]),
                  );
                }),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          )
        ]),
      ),
    );
  }
}
