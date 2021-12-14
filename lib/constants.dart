import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFF1EFF1);
const kMyColor = Color(0xFFe2e6ea);
const kPrimaryColor = Color(0xFF0070CD);
const kSecondaryColor = Color(0xFFfcca46);
const kTextColor = Color(0xFF023047);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF044896);
const btn = Color(0xffc4e1f2);

const textCard = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const kTextFieldDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.search_rounded,
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);

const kDefaultPadding = 20.0;
