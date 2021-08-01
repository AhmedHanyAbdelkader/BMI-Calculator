import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double hvalue = 180;
var sliderval;
double wvalue = 80;
bool _value = false;
int val = 1;
int result;
var random;

double width = 250;
double height = 200;

BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

double padValue = 8.0;

String category = '';
String advice = '';

var mygradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.black, Colors.blue[300]]);

var buttonStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

var resultStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white);
var categoryStyle = TextStyle(
    fontSize: 30,
    shadows: [
      Shadow(
        blurRadius: 15.0,
        color: Colors.blue,
        offset: Offset(5.0, 5.0),
      ),
      Shadow(
        blurRadius: 15,
        color: Colors.blueGrey,
        offset: Offset(-5.0, 5.0),
      ),
    ],
    fontWeight: FontWeight.bold,
    color: Colors.white);
var adviceStyle = TextStyle(
    decoration: TextDecoration.underline,
    fontSize: 20,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Colors.black,
        offset: Offset(5.0, 5.0),
      ),
      Shadow(
        blurRadius: 10.0,
        color: Colors.blue,
        offset: Offset(-5.0, 5.0),
      ),
    ],
    fontWeight: FontWeight.w500,
    color: Colors.white);
