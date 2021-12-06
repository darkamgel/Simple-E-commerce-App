import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key, required this.item}) :
  super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder(),
      // elevation: 0.0,
      child: ListTile(
        onTap: (){
          print("This is ${item.name}");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing:
         Text("\$${item.price}",
         textScaleFactor: 1.6,
         style: TextStyle(
           fontWeight: FontWeight.bold,
           color: Colors.deepPurple,
         ),),
      ),
    );
  }
}