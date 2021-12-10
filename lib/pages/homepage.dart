import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
// import 'package:flutter_catalog/pages/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/item_widgets.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';
// import 'velocity_x';
import 'package:velocity_x/velocity_x.dart';

// import 'home_widgets/catalog_header.dart';

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
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed:() => Navigator.pushNamed(context, MyRoutes.cartRoute) ,
        child: Icon(CupertinoIcons.cart),
        backgroundColor: MyTheme.DarkBluishColor,
        ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogeModel.items != null && CatalogeModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16(),
            ],
          ),
        ),
      ),

      // appBar: AppBar(
      //   // backgroundColor: Colors.white,
      //   // elevation: 0.0,
      //   // iconTheme: IconThemeData(color: Colors.black),
      //   title: Text(
      //     "Catalog App",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
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
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogeModel.items != null && CatalogeModel.items.isNotEmpty)
      //   ? GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 16,
      //     crossAxisSpacing: 16,

      //         ),
      //      itemBuilder: (context,index){
      //        final item = CatalogeModel.items[index];
      //        return Card(
      //          clipBehavior: Clip.antiAlias,
      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      //          child: GridTile(
      //           header: Container(
      //             child: Text(item.name,style:
      //               TextStyle(color: Colors.white),),

      //             padding: EdgeInsets.all(12.0),

      //             decoration: BoxDecoration(
      //               color: Colors.deepPurple,
      //             ),

      //             ),
      //           footer: Container(
      //             child: Text(item.price.toString(),
      //             style:TextStyle(color: Colors.white),),

      //             padding: EdgeInsets.all(12.0),

      //             decoration: BoxDecoration(
      //               color: Colors.black,
      //             ),

      //             ),

      //           child: Image.network(item.image),));
      //      },
      //      itemCount: CatalogeModel.items.length,

      //      )
      //   // ? ListView.builder(
      //   //     // itemCount: CatalogeModel.items.length,
      //   //     itemCount: CatalogeModel.items.length,
      //   //     itemBuilder: (context, index) {
      //   //       return ItemWidget(
      //   //         // item: CatalogeModel.items[index],
      //   //         item: CatalogeModel.items[index],
      //   //       );
      //   //     })
      //   : Center(child: CircularProgressIndicator(),),
      // ),

      // drawer: MyDrawer(),
    );
  }
}






