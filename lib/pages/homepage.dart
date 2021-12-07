import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widgets.dart';
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "Sandeep";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 10));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogjson);
    final decodedData = jsonDecode(catalogJson);
    // print(decodedData);
    var productsData = decodedData["products"];
    // print(productsData);
    CatalogeModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(4, (index) => CatalogeModel.items[0]);

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
        child: (CatalogeModel.items != null && CatalogeModel.items.isNotEmpty) ? ListView.builder(
            // itemCount: CatalogeModel.items.length,
            itemCount: CatalogeModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                // item: CatalogeModel.items[index],
                item: CatalogeModel.items[index],
              );
            }): Center(child: CircularProgressIndicator(),),
      ),

      drawer: MyDrawer(),
    );
  }
}
