import 'package:flutter/material.dart';
import 'package:shopping_list/main.dart';

class ShoppingList extends StatefulWidget {

  ShoppingList({Key key, this.products}): super(key: key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingList>{
  //Create a bucket to hold the in cart items
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool isInCart){
    setState(() {
      if(isInCart){
        _shoppingCart.remove(product);
      }else{
        _shoppingCart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return ShoppingListItem(
            product: product,
            isInCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged
          );
        }).toList(),
      ),
    );
  }
}
