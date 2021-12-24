// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();

            // _cart.catalog = _catalog;
            AddMutation(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
