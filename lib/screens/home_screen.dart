import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vezeeta_flutter/constants.dart';
import 'package:vezeeta_flutter/screens/pharmacy_screen.dart';
import 'package:vezeeta_flutter/screens/specialist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registration_screen.dart';

class HomeScreen extends StatefulWidget {
  // static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _auth = FirebaseAuth.instance;
  // FirebaseAuth? loggedInUser;

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser!;
  //     if (user != null) {
  //       loggedInUser = user as FirebaseAuth?;
  //       // print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Vezeeta',
          style: GoogleFonts.almarai(
            textStyle: textCard,
            fontSize: 30,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40.0),
                    decoration: BoxDecoration(
                      color: kMyColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(180),
                        topRight: Radius.circular(180),
                      ),
                    ),
                  ),
                  ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 75,
                          vertical: kDefaultPadding / 2,
                        ),
                        // height: 135,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SpecialistScreen(),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: 115,
                                width: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 15),
                                      blurRadius: 25,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 60,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding),
                                  height: 110,
                                  width: 150,
                                  child: CircleAvatar(
                                    radius: 15.0,
                                    backgroundImage: AssetImage(
                                      'images/checks.jpg',
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                right: 15,
                                child: SizedBox(
                                  width: size.width - 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'كشف',
                                        style: GoogleFonts.almarai(
                                          textStyle: textCard,
                                        ),
                                      ),
                                      Text(
                                        'عيادة',
                                        style: GoogleFonts.almarai(
                                          textStyle: textCard,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 20,
                              right: 15,
                            ),
                            // height: 135,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PharmacyScreen(),
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 15),
                                          blurRadius: 25,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 40,
                                    right: 23,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding),
                                      height: 70,
                                      width: 100,
                                      child: Image.asset(
                                        'images/therapy.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 4,
                                    right: 2,
                                    child: SizedBox(
                                      width: size.width - 200,
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'صيدلية',
                                            style: GoogleFonts.almarai(
                                              textStyle: textCard,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 15,
                            ),
                            // height: 135,
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 15),
                                          blurRadius: 25,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 25,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding),
                                      height: 90,
                                      width: 150,
                                      child: CircleAvatar(
                                        radius: 15.0,
                                        backgroundImage: AssetImage(
                                          'images/callingDoctor.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 93,
                                    right: 1,
                                    child: SizedBox(
                                      width: size.width - 200,
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'مكالمة دكتور',
                                            style: GoogleFonts.almarai(
                                              textStyle: textCard,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 20,
                              right: 15,
                            ),
                            // height: 135,
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 15),
                                          blurRadius: 25,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 40,
                                    left: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding),
                                      height: 70,
                                      width: 170,
                                      child: Image.asset(
                                        'images/doctorCheck.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 4,
                                    right: 2,
                                    child: SizedBox(
                                      width: size.width - 200,
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'زيارة منزلية',
                                            style: GoogleFonts.almarai(
                                              textStyle: textCard,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 15,
                            ),
                            // height: 135,
                            child: InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 15),
                                          blurRadius: 25,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 25,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding),
                                      height: 90,
                                      width: 150,
                                      child: CircleAvatar(
                                        radius: 15.0,
                                        backgroundImage: AssetImage(
                                          'images/operation.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 95,
                                    right: 1,
                                    child: SizedBox(
                                      width: size.width - 200,
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'خدمة أو عملية',
                                            style: GoogleFonts.almarai(
                                              textStyle: textCard,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 15,
                            ),
                            // height: 135,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 120,
                                  width: 330,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 15),
                                        blurRadius: 25,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 29,
                                  // right: 33,
                                  child: SizedBox(
                                    // width: size.width - 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'احجز كشف عيادة',
                                          style: GoogleFonts.almarai(
                                            textStyle: textCard,
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SpecialistScreen(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.search_rounded,
                                                color: kBlueColor,
                                              ),
                                              Text(
                                                "ابحث بالتخصص, اسم الدكتور",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          minWidth: 100,
                                          color: btn,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 15,
                            ),
                            // height: 135,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 120,
                                  width: 330,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 15),
                                        blurRadius: 25,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 29,
                                  right: 30,
                                  child: SizedBox(
                                    // width: size.width - 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'اطلب أدوية',
                                          style: GoogleFonts.almarai(
                                            textStyle: textCard,
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.search_rounded,
                                                color: kBlueColor,
                                              ),
                                              Text(
                                                "ما الذي تبحث عنه؟",
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          minWidth: 300,
                                          color: btn,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 15,
                            ),
                            // height: 135,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  width: 330,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 15),
                                        blurRadius: 25,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 3,
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    height: 143,
                                    width: 205,
                                    child: Image.asset(
                                      'images/visitHome.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 19,
                                  right: 25,
                                  child: SizedBox(
                                    width: size.width - 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'زيارة منزلية',
                                          style: GoogleFonts.almarai(
                                            textStyle: textCard,
                                          ),
                                        ),
                                        Text(
                                          'اختار التخصص ،والدكتور هيجيلك البيت',
                                          style: TextStyle(
                                              // fontSize: 20,
                                              color: kTextLightColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Almarai'),
                                        ),
                                        FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            "احجز زيارة",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: kBlueColor,
                                            ),
                                          ),
                                          color: btn,
                                          minWidth: 30,
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 15,
                            ),
                            // height: 135,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  width: 330,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 15),
                                        blurRadius: 25,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 3,
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    height: 143,
                                    width: 205,
                                    child: Image.asset(
                                      'images/calling.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 19,
                                  right: 25,
                                  child: SizedBox(
                                    width: size.width - 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'مكالمة دكتور',
                                          style: GoogleFonts.almarai(
                                            textStyle: textCard,
                                          ),
                                        ),
                                        Text(
                                          'للمتابعة عبر مكالمة صوتية،أو مكالمة فيديو.',
                                          style: TextStyle(
                                              // fontSize: 20,
                                              color: kTextLightColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Almarai'),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SpecialistScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "احجز الآن",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: kBlueColor,
                                            ),
                                          ),
                                          color: btn,
                                          minWidth: 30,
                                          height: 40,
                                        ),
                                      ],
                                    ),
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
      ),
    );
  }
}
