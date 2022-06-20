class Item {
  final String id;
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
}

final products = [
  Item(
      id: "Catalog001",
      name: "Oneplus 7",
      desc: "Onplus 7 India",
      price: 32000,
      color: "#33505a",
      image:
          "https://www.gizmochina.com/wp-content/uploads/2019/05/oneplus_7_pro--500x500.jpg"),
];
