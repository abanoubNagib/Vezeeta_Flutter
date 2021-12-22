class Specialist {
  late String id;
  late String name;
  late String imgIcon;

  Specialist.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    imgIcon = data['imgIcon'];
  }
}
