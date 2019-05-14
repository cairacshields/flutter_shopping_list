import 'package:flutter/material.dart';
import 'package:shopping_list/ShoppingList.dart';

void main() => runApp(MaterialApp(
  title: "Shopping app",
  home: ShoppingList(
    products: <Product>[
      Product(name: "Eggs"),
      Product(name: "Bacon"),
      Product(name: "Grits"),
      Product(name: "Sausage")
    ],
  ),
));

//Creating an object class for products, they just have a name for now.
class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool isInCart);

class ShoppingListItem extends StatelessWidget{

  ShoppingListItem({Product product, this.isInCart, this.onCartChanged}):
      product = product,
      super(key: ObjectKey(product));

  final Product product;
  final bool isInCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context){
    return isInCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if (!isInCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, isInCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
