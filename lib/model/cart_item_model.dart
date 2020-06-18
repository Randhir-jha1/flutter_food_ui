import 'package:flutter/material.dart';
import 'package:flutter_food_ui/model/food_item_model.dart';

class MyCart extends ChangeNotifier {
  List<CartItem> items = [];
  List<CartItem> get cartItems => items;

  void addItem(CartItem cartItem) {
    for (CartItem cart in cartItems) {
      if (cartItem.food.name == cart.food.name) {
        cartItems[cartItems.indexOf(cart)].quantity++;
        notifyListeners();
        return;
      }
    }
    items.add(cartItem);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  void decreaseItem(CartItem cartModel) {
    if (cartItems[cartItems.indexOf(cartModel)].quantity <= 1) {
      return;
    }
    cartItems[cartItems.indexOf(cartModel)].quantity--;
    notifyListeners();
  }

  void increaseItem(CartItem cartModel) {
    cartItems[cartItems.indexOf(cartModel)].quantity++;
    notifyListeners();
  }

  void removeAllInCart(Food food) {
    cartItems.removeWhere((f) {
      return f.food.name == food.name;
    });
    notifyListeners();
  }
}

class CartItem {
  Food food;
  int quantity;

  CartItem({this.food, this.quantity});
}
