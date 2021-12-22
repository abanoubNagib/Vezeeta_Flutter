class Doctors {
  late String id;
  late String name;
  late String imgIcon;
  late String cat;
  late String img;
  late String location;
  late String price;
  late List imgClinic;
  late String waiting;
  late String info;
  late String subCat;

  Doctors.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    imgIcon = data['imgIcon'];
    cat = data['cat'];
    img = data['img'];
    location = data['location'];
    price = data['price'];
    imgClinic = data['imgClinic'];
    waiting = data['waiting'];
    info = data['info'];
    subCat = data['subCat'];
  }
}
