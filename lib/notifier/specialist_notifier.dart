import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:vezeeta_flutter/model/specialist.dart';

class SpecialistNotifier with ChangeNotifier {
  List<Specialist> _specialistList = [];
  late Specialist _currentSpecialist;

  UnmodifiableListView<Specialist> get specialistList =>
      UnmodifiableListView(_specialistList);

  Specialist get currentSpecialist => _currentSpecialist;

  set specialistList(List<Specialist> specialistList) {
    _specialistList = specialistList;
    notifyListeners();
  }

  set currentSpecialist(Specialist specialist) {
    _currentSpecialist = specialist;
    notifyListeners();
  }
}
