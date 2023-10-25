class Item {
  String category;
  String item;
  String price;
  String? quntity;
  String img;


  Item({
    required this.category,
    required this.item,
     this.quntity,
    required this.price,
    required this.img,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        category: json["category"],
        item: json["item"],
        price: json["price"],
        quntity: json["quntity"],
        img: json["img"],
        
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "item": item,
        "price": price,
        "quntity": quntity,
        "img": img,
      };
}