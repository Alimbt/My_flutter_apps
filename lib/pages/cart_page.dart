import 'package:coffee_shop/classes/bottom_navigation.dart';
import 'package:coffee_shop/classes/basket_manager.dart';
import 'package:coffee_shop/classes/lists.dart';
import 'package:coffee_shop/classes/mysquare.dart';
import 'package:coffee_shop/pages/favorite_page.dart';
import 'package:coffee_shop/pages/food_page.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'your basket ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: CartManager.getAllCart().length,
        itemBuilder: (context, index) {
          String CartItem = CartManager.getAllCart()[index];
          int coffeeIndex = Lists.ListCoffeeNames.indexOf(CartItem);
          int foodIndex = Lists.ListFoodsNames.indexOf(CartItem);

          String imageUrl;
          if (coffeeIndex != -1) {
            // اگر آیتم از لیست قهوه‌ها باشد
            imageUrl = Lists.CoffeeImageUrls[coffeeIndex];
          } else if (foodIndex != -1) {
            // اگر آیتم از لیست غذاها باشد
            imageUrl = Lists.FoodsImageUrls[foodIndex];
          } else {
            // اگر آیتم پیدا نشود، می‌توانید یک تصویر پیش‌فرض قرار دهید
            imageUrl = 'https://via.placeholder.com/150';
          }

          return Mysquare(
            imageUrl: imageUrl,
            name: CartItem,
            iconFavorite: () {},
            iconAdd: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text('$CartItem added to your cart'),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        onIconPressed: (index) {
          switch (index) {
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
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
