import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vezeeta_flutter/api/doctor_api.dart';
import 'package:vezeeta_flutter/constants.dart';
import 'package:vezeeta_flutter/notifier/doctors_notifier.dart';
import 'package:vezeeta_flutter/screens/doctorProfile_screen.dart';
import 'package:provider/provider.dart';

class DoctorsScreen extends StatefulWidget {
  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  void initState() {
    DoctorsNotifier doctorsNotifier =
        Provider.of<DoctorsNotifier>(context, listen: false);

    getDoctors(doctorsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DoctorsNotifier doctorsNotifier = Provider.of<DoctorsNotifier>(context);

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
          'تبحث في',
          style: GoogleFonts.almarai(
            textStyle: textCard,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'ابحث بإسم الدكتور أو المستشفي'),
              ),
            ),
            // SizedBox(
            //   height: kDefaultPadding / 2,
            // ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: kMyColor,
                    ),
                  ),
                  ListView.builder(
                      itemCount: doctorsNotifier.doctorsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                onTap: () {
                                  doctorsNotifier.currentDoctors =
                                      doctorsNotifier.doctorsList[index];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorProfileScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  height: 280,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: <Widget>[
                                      Container(
                                        height: 280,
                                        width: 360,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
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
                                          Container(
                                            color: Colors.grey[200],
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultPadding / 2,
                                                  ),
                                                  height: 100,
                                                  width: 120,
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                      doctorsNotifier
                                                          .doctorsList[index]
                                                          .img,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  child: SizedBox(
                                                    // height: size.width - 290,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          doctorsNotifier
                                                              .doctorsList[
                                                                  index]
                                                              .name,
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            color:
                                                                kPrimaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Text(
                                                          doctorsNotifier
                                                              .doctorsList[
                                                                  index]
                                                              .cat,
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            color:
                                                                kTextLightColor,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .star_half_rounded,
                                                                size: 17,
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Text(
                                                          'التقييم العام من 1004 زائر',
                                                          style: GoogleFonts
                                                              .almarai(
                                                            textStyle: textCard,
                                                            color:
                                                                kTextLightColor,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 25,
                                                width: 25,
                                                child: Image.network(
                                                  doctorsNotifier
                                                      .doctorsList[index]
                                                      .imgIcon,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'جلدية متخصص في تجميل وليزر الأطفال',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kTextLightColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 22,
                                                width: 22,
                                                child: Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.blue[700],
                                                  size: 23,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .doctorsList[index]
                                                    .location,
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kTextLightColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 22,
                                                width: 22,
                                                child: Icon(
                                                  Icons.price_change_outlined,
                                                  color: Colors.blue[700],
                                                  size: 23,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'سعر الكشف:',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kTextLightColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .doctorsList[index].price,
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kTextLightColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 22,
                                                width: 22,
                                                child: Icon(
                                                  Icons.watch_later_outlined,
                                                  color: Colors.blue[700],
                                                  size: 23,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'مدة الانتظار:',
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kPrimaryColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                doctorsNotifier
                                                    .doctorsList[index].waiting,
                                                style: GoogleFonts.almarai(
                                                  textStyle: textCard,
                                                  color: kPrimaryColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                height: 35,
                                                width: 240,
                                                color: Colors.grey[200],
                                                child: Center(
                                                  child: Text(
                                                    'متاح اليوم 04:00م',
                                                    style: GoogleFonts.almarai(
                                                      textStyle: textCard,
                                                      color: kTextLightColor,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                height: 35,
                                                width: 90,
                                                child: Center(
                                                  child: Text(
                                                    'احجز الان',
                                                    style: GoogleFonts.almarai(
                                                      textStyle: textCard,
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.redAccent[700],
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTf450b8/Profile/150/clinic-aladdin-seleem-dentistry_20210113003208184.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتور علاء سليم',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'ماجستير زراعة الاسنان',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 213 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Dentistry.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'اسنان متخصص في تركيبات اسنان',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'المحلة الكبري: شارع الفريق رضا حافظ',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 100 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 10 دقائق',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 03:30م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTaf7a4f/Profile/150/doctor-sally-mohamed-el-sheikh-psychiatry_20210119153648855.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتورة سالي محمد',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'استشاري الطب النفسي',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 278 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Psychiatry.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'نفسي متخصص في استشارات اسرية',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'الدقي: 53 شارع عمان بجوار نادي الصيد',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 650 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 33 دقيقة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 11:30م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT2a9372/Profile/150/doctor-ramy-ahmed-foaad-pediatrics-and-new-born_20201218181746445.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتور رامي احمد فؤاد',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'استشاري طب الاطفال',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 323 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Pediatrics and New Born.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'اطفال وحديثي الولادة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'محطة الرمل: شارع محمد رأفت',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 150 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: ساعة و 4 دقائق',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 08:00م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT49149352f0b39f10/Profile/150/brain-specialized-center_20200929002718898.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتور محمد توفيق',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'استشاري طب المخ والأعصاب',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 1074 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Neurology.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'متخصص في مخ واعصاب بالغين',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مصر الجديدة: الميرغني',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 800 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 44 دقيقة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 02:00م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT13fd35/Profile/150/doctor-amir-ahmed-ahmed-ahmed-oda-orthopedics_20170502191018.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتور امير عوده',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'استشاري جراحة المفاصل',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 233 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Orthopedics.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'عظام متخصص في اصابات ملاعب ومناظير',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'الدقي: شارع محي الدين أبو العز',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 500 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 32 دقيقة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 06:00م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT7ab4af/Profile/150/doctor-nesreen-mabrouk-gynaecology-and-infertility_20200407172515502.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتورة نسرين مبروك',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'استشاري النساء والتوليد',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 298 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Gynaecology and Infertility.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'نساء وتوليد متخصص ',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'فلمنج: شارع طمازين',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 200 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 35 دقيقة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 04:00م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTff09dd/Profile/150/doctor-hesham-mansour_20211203205117234.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتور هشام منصور',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'استاذ الانف والاذن والحنجرة',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 1404 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Ear, Nose and Throat.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'متخصص في انف واذن وحنجرة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'التجمع: شارع التسعين الشمالي',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 300 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 52 دقيقة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 05:00م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTe107b5c144501ba0/Profile/150/doctor-mohamed-said-elgamal-cardiology_20201115173019537.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتور محمد سعيد',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'أستاذ واستشاري القلب ولأوعية',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 1107 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Cardiology and Vascular Disease.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'متخصص في قلب واوعية دموية',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'الدقي: شارع الدقي',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 300 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 30 دقيقة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 04:00م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DoctorProfileScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       top: 15,
                              //     ),
                              //     height: 280,
                              //     child: Stack(
                              //       alignment: Alignment.bottomCenter,
                              //       children: <Widget>[
                              //         Container(
                              //           height: 280,
                              //           width: 360,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(3),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 offset: Offset(0, 12),
                              //                 blurRadius: 20,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Column(
                              //           children: <Widget>[
                              //             Container(
                              //               color: Colors.grey[200],
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Container(
                              //                     margin: EdgeInsets.only(top: 10),
                              //                     padding: EdgeInsets.symmetric(
                              //                       horizontal: kDefaultPadding / 2,
                              //                     ),
                              //                     height: 100,
                              //                     width: 120,
                              //                     child: CircleAvatar(
                              //                       backgroundImage: NetworkImage(
                              //                         'https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc1cc06/Profile/150/center-plasma-medical-center-hematology_20211129150816843.jpg',
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Positioned(
                              //                     child: SizedBox(
                              //                       // height: size.width - 290,
                              //                       child: Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           Text(
                              //                             'دكتور محمد فطين',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kPrimaryColor,
                              //                               fontWeight:
                              //                                   FontWeight.bold,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'مدرس واستشاري أمراض الدم',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 8,
                              //                           ),
                              //                           Container(
                              //                             child: Row(
                              //                               children: <Widget>[
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons.star,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                                 Icon(
                              //                                   Icons
                              //                                       .star_half_rounded,
                              //                                   size: 17,
                              //                                   color:
                              //                                       Colors.orange,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6,
                              //                           ),
                              //                           Text(
                              //                             'التقييم العام من 136 زائر',
                              //                             style:
                              //                                 GoogleFonts.almarai(
                              //                               textStyle: textCard,
                              //                               color: kTextLightColor,
                              //                               fontSize: 15,
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               height: 9,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 25,
                              //                   width: 25,
                              //                   child: Image.network(
                              //                     "https://cdn-dr-images.vezeeta.com/Specialties/Hematology.png",
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'متخصص في امراض دم بالغين',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.location_on_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'العجوزة: 16 ميدان المساحة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.price_change_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'سعر الكشف: 200 جنيه',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kTextLightColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 5,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 8),
                              //                   height: 22,
                              //                   width: 22,
                              //                   child: Icon(
                              //                     Icons.watch_later_outlined,
                              //                     color: Colors.blue[700],
                              //                     size: 23,
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 15,
                              //                 ),
                              //                 Text(
                              //                   'مدة الانتظار: 20 دقيقة',
                              //                   style: GoogleFonts.almarai(
                              //                     textStyle: textCard,
                              //                     color: kPrimaryColor,
                              //                     fontSize: 12,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //             SizedBox(
                              //               height: 13,
                              //             ),
                              //             Row(
                              //               children: <Widget>[
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 240,
                              //                   color: Colors.grey[200],
                              //                   child: Center(
                              //                     child: Text(
                              //                       'متاح اليوم 04:00م',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: kTextLightColor,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(right: 10),
                              //                   height: 35,
                              //                   width: 90,
                              //                   child: Center(
                              //                     child: Text(
                              //                       'احجز الان',
                              //                       style: GoogleFonts.almarai(
                              //                         textStyle: textCard,
                              //                         color: Colors.white,
                              //                         fontSize: 15,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     color: Colors.redAccent[700],
                              //                     borderRadius:
                              //                         BorderRadius.circular(4),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
