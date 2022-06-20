import 'package:carousel_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  //onst ItemWidget({Key? key}) : super(key: key);
  final Item item; // final means no one change it after creation.

  const ItemWidget({super.key, required this.item})
      : assert(item !=
            null); //asserts are only used in debugging time not in production.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            print("${item.name} pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$  ${item.price.toString()}",
            textScaleFactor: 1.3,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
