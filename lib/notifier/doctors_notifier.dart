import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:vezeeta_flutter/model/doctors.dart';

class DoctorsNotifier with ChangeNotifier {
  List<Doctors> _doctorsList = [];
  late Doctors _currentDoctors;

  UnmodifiableListView<Doctors> get doctorsList =>
      UnmodifiableListView(_doctorsList);

  Doctors get currentDoctors => _currentDoctors;

  set doctorsList(List<Doctors> doctorsList) {
    _doctorsList = doctorsList;
    notifyListeners();
  }

  set currentDoctors(Doctors doctors) {
    _currentDoctors = doctors;
    notifyListeners();
  }
}
