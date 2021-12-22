import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vezeeta_flutter/api/doctor_api.dart';
import 'package:vezeeta_flutter/constants.dart';
import 'package:vezeeta_flutter/notifier/specialist_notifier.dart';
import 'package:vezeeta_flutter/screens/doctors_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialistScreen extends StatefulWidget {
  @override
  _SpecialistScreenState createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {
  @override
  void initState() {
    SpecialistNotifier specialistNotifier =
        Provider.of<SpecialistNotifier>(context, listen: false);

    getSpecialist(specialistNotifier);

    super.initState();
  }

  // void getMessages() async {
  //   final specs =
  //       await FirebaseFirestore.instance.collection('specialist').get();
  //   for (var spec in specs.docs) {
  //     print(spec.data());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SpecialistNotifier specialistNotifier =
        Provider.of<SpecialistNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            // getMessages();
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'ابحث عن دكتور',
          style: GoogleFonts.almarai(
            textStyle: textCard,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.right,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'ابحث في التخصصات'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'التخصصات الأكثر اختيارا',
              style: GoogleFonts.almarai(
                textStyle: textCard,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: specialistNotifier.specialistList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorsScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  specialistNotifier
                                      .specialistList[index].imgIcon,
                                  // "https://cdn-dr-images.vezeeta.com/Specialties/Dermatology.png",
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                specialistNotifier.specialistList[index].name,
                                // "جلدية",
                                style: GoogleFonts.almarai(
                                  textStyle: textCard,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 350.0,
                          child: Divider(
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
