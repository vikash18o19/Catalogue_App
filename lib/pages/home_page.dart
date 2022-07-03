import 'package:carousel_app/models/catalog.dart';
import 'package:carousel_app/pages/home_widgets/catalog_header.dart';
import 'package:carousel_app/pages/home_widgets/catalog_list.dart';
import 'package:carousel_app/utils/routes.dart';
import 'package:carousel_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import "package:velocity_x/velocity_x.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // before build method is called if we can data get data here we directly pass data to build.
    super.initState();
    loadData();
  }

  loadData() async {
    //await Future.delayed(Duration(seconds: 10));

    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); // it returns future, ie. it can take time to extract. thus use await.
    // But we cannot use this JSON we need to decode it.
    final decodedData = jsonDecode(
        catalogJson); // here we are converting string data to JSON map. similarly we can use encode.
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[900],
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Scrollbar(
            thumbVisibility: true,
            child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    const CatalogList().expand()
                  else
                    const CircularProgressIndicator()
                        .centered()
                        .py16()
                        .expand(),
                ],
              ),
            ),
          ),
        ));
  }
}
