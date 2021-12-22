import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vezeeta_flutter/constants.dart';
import 'package:vezeeta_flutter/notifier/doctors_notifier.dart';
import 'package:vezeeta_flutter/screens/home_screen.dart';
import 'package:vezeeta_flutter/screens/registration_screen.dart';
import 'package:vezeeta_flutter/screens/reservation_screen.dart';

class DoctorProfileScreen extends StatefulWidget {
  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
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
          'بيانات الدكتور',
          style: GoogleFonts.almarai(
            textStyle: textCard,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    height: 100,
                    width: 120,
                    child: Image.network(
                      doctorsNotifier.currentDoctors.img,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        doctorsNotifier.currentDoctors.name,
                        style: GoogleFonts.almarai(
                          textStyle: textCard,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              size: 25,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star_half_rounded,
                              size: 25,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'التقييم العام من 1004 زائر',
                        style: GoogleFonts.almarai(
                          textStyle: textCard,
                          color: kPrimaryColor,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        doctorsNotifier.currentDoctors.cat,
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
                            height: 430,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 430,
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 18,
                                            ),
                                            Text(
                                              doctorsNotifier
                                                  .currentDoctors.price,
                                              style: GoogleFonts.almarai(
                                                textStyle: textCard,
                                                fontSize: 15,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'سعر الكشف',
                                              style: GoogleFonts.almarai(
                                                textStyle: textCard,
                                                fontSize: 15,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 35),
                                          height: 50,
                                          width: 50,
                                          child: Icon(
                                            Icons.watch_later_outlined,
                                            color: Colors.blue[700],
                                            size: 35,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 18,
                                            ),
                                            Text(
                                              doctorsNotifier
                                                  .currentDoctors.waiting,
                                              style: GoogleFonts.almarai(
                                                textStyle: textCard,
                                                fontSize: 15,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'وقت الانتظار',
                                              style: GoogleFonts.almarai(
                                                textStyle: textCard,
                                                fontSize: 15,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 9,
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
                                          margin: EdgeInsets.only(right: 8),
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
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                      width: 350.0,
                                      child: Divider(
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'اختر ميعاد حجزك',
                                          style: GoogleFonts.almarai(
                                            textStyle: textCard,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReservationScreen(),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue[700],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(6),
                                                        topRight:
                                                            Radius.circular(6),
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: 60,
                                                    ),
                                                    width: 80,
                                                    height: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'اليوم',
                                                        style:
                                                            GoogleFonts.almarai(
                                                                textStyle:
                                                                    textCard,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.grey[200],
                                                    margin: EdgeInsets.only(
                                                      right: 60,
                                                    ),
                                                    width: 80,
                                                    height: 90,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14.0),
                                                      child: Center(
                                                        child: Text(
                                                          "من 4م الي 11م",
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            fontSize: 15,
                                                            color: Colors
                                                                .grey[600],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.redAccent[700],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(6),
                                                        bottomRight:
                                                            Radius.circular(6),
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: 60,
                                                    ),
                                                    width: 80,
                                                    height: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'احجز',
                                                        style:
                                                            GoogleFonts.almarai(
                                                                textStyle:
                                                                    textCard,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReservationScreen(),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue[700],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(6),
                                                        topRight:
                                                            Radius.circular(6),
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    width: 80,
                                                    height: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'غدا',
                                                        style:
                                                            GoogleFonts.almarai(
                                                                textStyle:
                                                                    textCard,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.grey[200],
                                                    margin: EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    width: 80,
                                                    height: 90,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14.0),
                                                      child: Center(
                                                        child: Text(
                                                          "من 4م الي 11م",
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            fontSize: 15,
                                                            color: Colors
                                                                .grey[600],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.redAccent[700],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(6),
                                                        bottomRight:
                                                            Radius.circular(6),
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    width: 80,
                                                    height: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'احجز',
                                                        style:
                                                            GoogleFonts.almarai(
                                                                textStyle:
                                                                    textCard,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReservationScreen(),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue[700],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(6),
                                                        topRight:
                                                            Radius.circular(6),
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    width: 80,
                                                    height: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'الاحد 1/5',
                                                        style:
                                                            GoogleFonts.almarai(
                                                                textStyle:
                                                                    textCard,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.grey[200],
                                                    margin: EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    width: 80,
                                                    height: 90,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14.0),
                                                      child: Center(
                                                        child: Text(
                                                          "من 4م الي 11م",
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            fontSize: 15,
                                                            color: Colors
                                                                .grey[600],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.redAccent[700],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(6),
                                                        bottomRight:
                                                            Radius.circular(6),
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    width: 80,
                                                    height: 30,
                                                    child: Center(
                                                      child: Text(
                                                        'احجز',
                                                        style:
                                                            GoogleFonts.almarai(
                                                                textStyle:
                                                                    textCard,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'الدخول بأسبقية الحضور',
                                          style: GoogleFonts.almarai(
                                            textStyle: textCard,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 9,
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
                                          margin: EdgeInsets.only(
                                            right: 8,
                                            top: 10,
                                          ),
                                          height: 22,
                                          width: 22,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Text(
                                            '4/5 تقييم العيادة',
                                            style: GoogleFonts.almarai(
                                              textStyle: textCard,
                                              fontSize: 16,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: 17,
                                            top: 10,
                                          ),
                                          height: 22,
                                          width: 22,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Text(
                                            '4/5 تقييم المساعد',
                                            style: GoogleFonts.almarai(
                                              textStyle: textCard,
                                              fontSize: 16,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                            ),
                            height: 170,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 170,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        'العيادة',
                                        style: GoogleFonts.almarai(
                                          textStyle: textCard,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    GridView.count(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 4,
                                      children: doctorsNotifier
                                          .currentDoctors.imgClinic
                                          .map(
                                            (e) => Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: kDefaultPadding,
                                                ),
                                                height: 100,
                                                width: 120,
                                                child: Image.network(e)),
                                          )
                                          .toList(),
                                    ),
                                    // Row(
                                    //   children: <Widget>[
                                    //     Container(
                                    //       padding: EdgeInsets.symmetric(
                                    //         horizontal: kDefaultPadding,
                                    //       ),
                                    //       height: 100,
                                    //       width: 120,
                                    //       child: Image.network(
                                    //         "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT258f02/Facilities/doctor-hany-khalil-dermatology_20180412181820458.jpg",
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       padding: EdgeInsets.symmetric(
                                    //         horizontal: kDefaultPadding,
                                    //       ),
                                    //       height: 100,
                                    //       width: 120,
                                    //       child: Image.network(
                                    //         "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT258f02/Facilities/doctor-hany-khalil-dermatology_20190702015146029.jpg",
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       padding: EdgeInsets.symmetric(
                                    //         horizontal: kDefaultPadding,
                                    //       ),
                                    //       height: 100,
                                    //       width: 120,
                                    //       child: Image.network(
                                    //         "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT258f02/Facilities/doctor-hany-khalil-dermatology_20210912210338843.jpg",
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                            ),
                            height: 220,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 220,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        'معلومات عن الدكتور',
                                        style: GoogleFonts.almarai(
                                          textStyle: textCard,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        doctorsNotifier.currentDoctors.info,
                                        style: GoogleFonts.almarai(
                                          textStyle: textCard,
                                          fontSize: 16,
                                          color: Colors.grey[700],
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
