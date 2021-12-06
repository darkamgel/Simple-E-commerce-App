import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widgets.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  final int days = 30;
  final String name = "Sandeep";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(4, (index) => CatalogeModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      // body: Container(
      //   constraints: BoxConstraints(
      //     minHeight: 70,
      //     maxHeight: 200,
      //     minWidth: 70,
      //     maxWidth: 200,
      //   ),
      //   color: Colors.green,
      //   child: Container(
      //     height: 10, // yesle yo height lidaina mathi herum
      //     width:  10,
      //     color: Colors.red,

      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            // itemCount: CatalogeModel.items.length,
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                // item: CatalogeModel.items[index],
                item: dummyList[index],
              );
            }),
      ),

      drawer: MyDrawer(),
    );
  }
}
