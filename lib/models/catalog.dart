class CatalogModel {
  static List<Item> items = [
    // static because we want to directly use it by calling CatalogModel
    Item(
        id: 1,
        name: "Oneplus 7",
        desc: "Onplus 7 India",
        price: 32000,
        color: "#33505a",
        image:
            "https://www.gizmochina.com/wp-content/uploads/2019/05/oneplus_7_pro--500x500.jpg"),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
