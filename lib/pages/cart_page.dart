import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent,
      title: "Cart".text.make(),
      ),

      body:Column(
        children: [
          // Placeholder().p32().expand(),
          _cartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
  // const _c({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(Theme.of(context).accentColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet.".text.make())
                );

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor)
            ),
            child: "Buy".text.white.make(),

            )
        ],


      ),
    );
  }
}


class _cartList extends StatefulWidget {
  const _cartList({Key? key}) : super(key: key);

  @override
  State<_cartList> createState() => _cartListState();
}

class _cartListState extends State<_cartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon:Icon(Icons.remove_circle_outline),
        onPressed: (){},

        ),
        title:_cart.items[index].name.text.make(),
      ) ,

    );
  }
}