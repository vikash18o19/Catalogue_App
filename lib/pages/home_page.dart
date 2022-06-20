import 'package:carousel_app/models/catalog.dart';
import 'package:carousel_app/widgets/drawer.dart';
import 'package:carousel_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
    await Future.delayed(Duration(seconds: 10));

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
      appBar: AppBar(title: const Text('App')),
      body: (CatalogModel.items != null) && (CatalogModel.items.isNotEmpty)
          ? ListView.builder(
              itemCount: CatalogModel.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  item: CatalogModel.items[index],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ), // builder gives recycler view. ie the items currently visible will only be rendered not others if want to then scroll.
      drawer: const MyDrawer(),
    );
  }
}
