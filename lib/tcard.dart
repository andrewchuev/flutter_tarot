class TCard {
  int id;
  String title;
  String desc;
  String image;
  int orderNo;
  String fullDesc;
  String groupId;

  TCard({this.id, this.title, this.desc, this.image, this.orderNo, this.fullDesc, this.groupId});

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['desc'] = desc;
    map['image'] = image;
    map['orderNo'] = orderNo;
    map['fullDesc'] = fullDesc;
    map['groupId'] = groupId;

    return map;
  }

  // Extract a Note object from a Map object
  TCard.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.desc = map['desc'];
    this.image = map['image'];
    this.orderNo = map['orderNo'];
    this.fullDesc = map['fullDesc'];
    this.groupId = map['groupId'];
  }
}



