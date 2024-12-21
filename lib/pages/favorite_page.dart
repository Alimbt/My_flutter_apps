import 'package:coffee_shop/classes/bottom_navigation.dart';
import 'package:coffee_shop/classes/favorites_manager.dart';
import 'package:coffee_shop/classes/lists.dart';
import 'package:coffee_shop/classes/mysquare.dart';
import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/food_page.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'favorite lists',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: FavoritesManager.getAllFavorites().length,
        itemBuilder: (context, index) {
          String favoriteItem = FavoritesManager.getAllFavorites()[index];
          int coffeeIndex = Lists.ListCoffeeNames.indexOf(favoriteItem);
          int foodIndex = Lists.ListFoodsNames.indexOf(favoriteItem);

          String imageUrl;
          if (coffeeIndex != -1) {
            // اگر آیتم از لیست قهوه‌ها باشد
            imageUrl = Lists.CoffeeImageUrls[coffeeIndex];
          } else if (foodIndex != -1) {
            // اگر آیتم از لیست غذاها باشد
            imageUrl = Lists.FoodsImageUrls[foodIndex];
          } else {
            imageUrl = 'https://via.placeholder.com/150';
          }

          return Mysquare(
            imageUrl: imageUrl,
            name: favoriteItem,
            iconFavorite: () {},
            iconAdd: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text('$favoriteItem added to your favorite cart'),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        onIconPressed: (index) {
          switch (index) {
            //cart page
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
              break;
            //home page
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FoodPage()));
              break;
          }
        },
      ),
    );
  }
}
