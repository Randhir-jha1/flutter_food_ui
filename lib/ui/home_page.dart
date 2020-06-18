import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ui/constants.dart';
import 'package:flutter_food_ui/model/cart_item_model.dart';
import 'package:flutter_food_ui/model/food_item_model.dart';
import 'package:flutter_food_ui/ui/cart_bottom_sheet.dart';
import 'package:flutter_food_ui/ui/food_item_card.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 1;
  int state = 0;


  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            buildAppBar(),
            buildFoodFilter(),
            Divider(),
            buildFoodList(),
            SafeArea(
                child: Container (
                    child: CupertinoTabBar(
                      items: <BottomNavigationBarItem> [
                        BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), title: Text("Menu")),
                        BottomNavigationBarItem(icon: Icon(Icons.supervisor_account), title: Text("Account")),
                        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("Cart")),
                      ],
                      currentIndex: state,
                      onTap: (int index) {
                        setState(() {
                          state = index;
                           if(state==2)
                             {

                             }
                        });
                      },
                    )

                )
            )

          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    int items = 0;
    Provider.of<MyCart>(context).cartItems.forEach((cart) {
      items += cart.quantity;
    });
    return SafeArea(
      child: Row(
        children: <Widget>[
          Text('MENU', style: headerStyle),
          Spacer(),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          Stack(
            children: <Widget>[
              IconButton(icon: Icon(Icons.filter_list), onPressed: showCart),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
                  child: Text(
                    '$items',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget buildFoodFilter() {
    return Container(
      height: 50,
      //color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: List.generate(FoodTypes.values.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),

            child: ChoiceChip(
              selectedColor: mainColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(0),bottomRight: Radius.circular(0))),

              labelStyle: TextStyle(color: value == index ? Colors.white : Colors.black),
              label: Text(FoodTypes.values[index].toString().split('.').last),
              selected: value == index,
              onSelected: (selected) {
                setState(() {
                  value = selected ? index : null;
                });
              },
            ),

          );
        }),
      ),
    );
  }

  Widget buildFoodList() {
    return Expanded(
      child: GridView.count(
        //itemCount: foods.length,
        childAspectRatio: 0.65,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        children: foods.map((food) {
          return FoodCard(food);
        }).toList(),
      ),
    );
  }
}
