import 'package:coffee_shop/classes/bottom_navigation.dart';
import 'package:coffee_shop/classes/basket_manager.dart';
import 'package:coffee_shop/classes/favorites_manager.dart';
import 'package:coffee_shop/classes/mysquare.dart';

import 'package:coffee_shop/classes/lists.dart';
import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/favorite_page.dart';
import 'package:coffee_shop/pages/food_page.dart';
import 'package:flutter/material.dart';

// import 'package:coffe_shop/dbcontext.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'Coffee Shop Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      //list view
      body: ListView.builder(
        itemCount: Lists.ListCoffeeNames.length,
        itemBuilder: (context, index) {
          return Mysquare(
            imageUrl: Lists.CoffeeImageUrls[index], // استفاده از لیست تصاویر
            name: Lists.ListCoffeeNames[index],

            iconFavorite: () {
              FavoritesManager.addFavoriteCoffee(Lists.ListCoffeeNames[index]);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('${Lists.ListCoffeeNames[index]} added to favorites'),
                duration: const Duration(seconds: 1),
              ));
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.coffee,
                  size: 30,
                  color: Color.fromARGB(255, 219, 200, 22),
                ),
              );
            },

            iconAdd: () {
              CartManager.addcartCoffee(Lists.ListCoffeeNames[index]);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${Lists.ListCoffeeNames[index]} added to Cart'),
                duration: const Duration(seconds: 1),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        onIconPressed: (index) {
          // اجرای دستور مربوط به هر دکمه
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FoodPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
