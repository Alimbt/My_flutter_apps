import 'package:coffee_shop/classes/bottom_navigation.dart';
import 'package:coffee_shop/classes/basket_manager.dart';
import 'package:coffee_shop/classes/favorites_manager.dart';
import 'package:coffee_shop/classes/lists.dart';
import 'package:coffee_shop/classes/mysquare.dart';
import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/favorite_page.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'foods menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: Lists.ListFoodsNames.length,
        itemBuilder: (context, index) {
          return Mysquare(
            imageUrl: Lists.FoodsImageUrls[index], // استفاده از لیست تصاویر
            name: Lists.ListFoodsNames[index],

            iconFavorite: () {
              FavoritesManager.addFavoriteFood(Lists.ListFoodsNames[index]);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('${Lists.ListFoodsNames[index]} added to favorites'),
                duration: const Duration(seconds: 1),
              ));
            },

            iconAdd: () {
              CartManager.addCartFood(Lists.ListCoffeeNames[index]);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${Lists.ListFoodsNames[index]} added to Cart'),
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
                MaterialPageRoute(builder: (context) => const FavoritePage()),
              );
              break;

            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
          }
        },
      ),
    );
  }
}
