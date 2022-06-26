import 'package:carousel_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Image.network(catalog.image).h32(context),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                height: 30.0,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ).centered(),
      ),
    );
  }
}
