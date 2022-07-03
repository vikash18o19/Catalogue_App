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
      backgroundColor: Colors.white,
      bottomNavigationBar: ButtonBar(
        buttonPadding: EdgeInsets.zero,
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.bold.red800.xl4.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 40, 39, 42)),
                shape: MaterialStateProperty.all(StadiumBorder())),
            child: "Add to Cart".text.make(),
          ).wh(140, 50),
        ],
      ).p32().backgroundColor(Color.fromARGB(255, 226, 222, 246)),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Image.network(catalog.image).h32(context),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                height: 30.0,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Color.fromARGB(255, 226, 222, 246),
                  child: Column(
                    children: [
                      catalog.name.text.xl3.bold.make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Clita magna sed sed at et at dolor kasd, amet vero takimata et takimata, at diam lorem voluptua justo dolore ut ea rebum, sit sit ut sed kasd accusam nonumy gubergren ipsum. Ut at vero vero dolor, sadipscing amet takimata invidunt est ut, sit ea amet et takimata stet sea.."
                          .text
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ).centered(),
      ),
    );
  }
}
