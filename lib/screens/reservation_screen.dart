import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vezeeta_flutter/constants.dart';
import 'package:vezeeta_flutter/notifier/doctors_notifier.dart';
import 'package:vezeeta_flutter/screens/doctorProfile_screen.dart';
import 'package:vezeeta_flutter/screens/home_screen.dart';
import 'package:vezeeta_flutter/screens/registration_screen.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    DoctorsNotifier doctorsNotifier =
        Provider.of<DoctorsNotifier>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // centerTitle: false,
        title: Text(
          'تأكيد الحجز',
          style: GoogleFonts.almarai(
            textStyle: textCard,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    height: 90,
                    width: 120,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        doctorsNotifier.currentDoctors.img,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        doctorsNotifier.currentDoctors.name,
                        style: GoogleFonts.almarai(
                          textStyle: textCard,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        doctorsNotifier.currentDoctors.subCat,
                        style: GoogleFonts.almarai(
                          textStyle: textCard,
                          color: kTextLightColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: kMyColor,
                    ),
                  ),
                  ListView(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 15,
                            ),
                            height: 350,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 350,
                                  width: 360,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 12),
                                        blurRadius: 20,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 28.0),
                                      child: Column(
                                        children: <Widget>[
                                          TextFormField(
                                            keyboardType: TextInputType.name,
                                            style:
                                                TextStyle(color: Colors.black),
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {},
                                            decoration: InputDecoration(
                                              fillColor: Colors.black,
                                              labelText: 'Full Name',
                                              errorStyle: TextStyle(
                                                color: Colors.red[700],
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            style:
                                                TextStyle(color: Colors.black),
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {},
                                            decoration: InputDecoration(
                                              fillColor: Colors.black,
                                              labelText: 'Mobile',
                                              errorStyle: TextStyle(
                                                color: Colors.red[700],
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          height: 50,
                                          width: 50,
                                          child: Icon(
                                            Icons.price_change_outlined,
                                            color: Colors.blue[700],
                                            size: 35,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'سعر الكشف',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  fontSize: 15,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 130,
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .currentDoctors.price,
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  fontSize: 15,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                      width: 350.0,
                                      child: Divider(
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          height: 22,
                                          width: 22,
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.blue[700],
                                            size: 35,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          doctorsNotifier
                                              .currentDoctors.location,
                                          style: GoogleFonts.almarai(
                                            textStyle: textCard,
                                            fontSize: 15,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                      width: 350.0,
                                      child: Divider(
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          height: 22,
                                          width: 22,
                                          child: Icon(
                                            Icons.assignment_rounded,
                                            color: Colors.blue[700],
                                            size: 35,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '4 : 11',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  fontSize: 20,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'الثلاثاء 21 ديسمبر',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  fontSize: 16,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Center(
                                  child: Text(
                                    'تم التأكيد',
                                    style: GoogleFonts.almarai(),
                                  ),
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.only(right: 70),
                                  child: Text(
                                    'تم التأكيد بنجاح',
                                    style: GoogleFonts.almarai(),
                                  ),
                                ),
                                actions: [
                                  Container(
                                    width: 268,
                                    height: 35,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.almarai(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 20,
                            child: Center(
                              child: Text(
                                'تأكيد الحجز',
                                style: GoogleFonts.almarai(
                                  textStyle: textCard,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: kBlueColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
