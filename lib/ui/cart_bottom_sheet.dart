import 'package:flutter/material.dart';
import 'package:flutter_food_ui/constants.dart';
import 'package:flutter_food_ui/model/cart_item_model.dart';
import 'package:flutter_food_ui/model/food_item_model.dart';
import 'package:flutter_food_ui/ui/checkout_page.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCart cart = Provider.of<MyCart>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Container(
              width: 90,
              height: 8,
              decoration: ShapeDecoration(
                  shape: StadiumBorder(), color: Colors.black26),
            ),
          ),
          buildTitle(cart),
          Divider(),
          if (cart.cartItems.length <= 0)
            noItemWidget()
          else
            buildItemsList(cart),
          Divider(),
          buildPriceInfo(cart),
          SizedBox(height: 8),
          addToCardButton(cart, context),
        ],
      ),
    );
    //});
  }

  Widget buildTitle(cart) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Your Order', style: headerStyle),
        IconButton(icon: Icon(Icons.delete_forever), onPressed: cart.clearCart),
      ],
    );
  }

  Widget buildItemsList(MyCart cart) {
    ScrollController scrollController = ScrollController();
    return Expanded(
      child: ListView.builder(
        itemCount: cart.cartItems.length,
        shrinkWrap: true,
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          return buildCartItemList(cart, cart.cartItems[index]);
        },
      ),
    );
  }
  Widget buildCartItemList(MyCart cart, CartItem cartModel) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: Text(
                      cartModel.food.name,
                      style: titleStyle,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                        child: Text('Qty:', style: subtitleStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                        child: Text('${cartModel.quantity}', style: subtitleStyle),
                      ),

                    ],
                  )
                ],
              ),
            ),

            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 70,
                    child: Text(
                      '\u{20B9} ${cartModel.food.price}',
                      style: subtitleStyle,
                      textAlign: TextAlign.end,

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noItemWidget() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('You don\'t have any order yet!!', style: titleStyle2),
            SizedBox(height: 16),
            Icon(Icons.remove_shopping_cart, size: 40),
          ],
        ),
      ),
    );
  }

  Widget buildPriceInfo(MyCart cart) {
    double total = 0;
    for (CartItem cartModel in cart.cartItems) {
      total += cartModel.food.price * cartModel.quantity;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total:', style: headerStyle),
        Text('\u{20B9} ${total.toStringAsFixed(2)}', style: headerStyle),
      ],
    );
  }

  Widget addToCardButton(cart, context) {
    return Center(
      child: RaisedButton(
        child: Text('Add to Cart', style: titleStyle),
        onPressed: cart.cartItems.length == 0
            ? null
            : () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckOutPage()));
              },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: mainColor,
        shape: StadiumBorder(),
      ),
    );
  }
}
