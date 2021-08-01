import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:session3_4course4/variables.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMICalculator'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: mygradient),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    ExpandSlider('Height' ,'assests/images/height.png', 'CM',hvalue ,100 , 200 ),
                    ExpandSlider('Weight' ,'assests/images/scale.png', 'KG',wvalue ,40 , 180 ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         gradient: LinearGradient(
                    //             begin: Alignment.topRight,
                    //             end: Alignment.bottomLeft,
                    //             colors: [Colors.blue[300],Colors.black]),
                    //         borderRadius: BorderRadius.circular(15.0),
                    //       ),
                    //       //color: Colors.cyan,
                    //       child: Column(
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //               children: [
                    //                 Text(
                    //                   'Weight',
                    //                   style: TextStyle(
                    //                       fontSize: 16, fontWeight: FontWeight.bold),
                    //                 ),
                    //                 Image(
                    //                   image: AssetImage('assests/images/scale.png'),
                    //                   height: 30,
                    //                   width: 30,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.baseline,
                    //             textBaseline: TextBaseline.alphabetic,
                    //             children: [
                    //               Text(
                    //                 '$wvalue',
                    //                 style: TextStyle(
                    //                   fontSize: 25,
                    //                   fontWeight: FontWeight.w900,
                    //                 ),
                    //               ),
                    //               Text(
                    //                 'KG',
                    //                 style: TextStyle(
                    //                   fontSize: 17,
                    //                   fontWeight: FontWeight.w800,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Expanded(child: Container(
                    //             width: 180,
                    //             height: 180,
                    //             child: Transform(
                    //               alignment: FractionalOffset.center,
                    //               // Rotate sliders by 90 degrees
                    //               transform: new Matrix4.identity()
                    //                 ..rotateZ(90 * 3.1415927 / 180),
                    //               child: Slider(
                    //                 activeColor: Colors.yellow,
                    //                 inactiveColor: Colors.black,
                    //                 min: 40,
                    //                 max: 180,
                    //                 value: wvalue,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     wvalue = value.roundToDouble();
                    //                   });
                    //                 },
                    //               ),
                    //             ),
                    //           )),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                      gradient: mygradient,
                    //color: Colors.cyan,
                  ),
                  height: 100,
                  child: Column(
                    children: [
                      MyListTile('Male',1),
                      MyListTile('FeMale',2),
                    ],
                  ),
                ),
              ),
            ),
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                  height: 10,
                  minWidth: double.infinity,
                  color: Colors.black,
                  child: Text(
                    'Calculate',
                    style: buttonStyle,
                  ),
                  onPressed: () {
                    setState(() {
                      double x = wvalue / (hvalue * hvalue) * 10000;
                      result = x.round();
                      if(result<18.5){
                        category='Underweight';
                        advice='You should eat more';
                      }else if(result <25 && result >=18.5){
                        category = 'Normal';
                        advice='You should keep your weight';
                      }else if(result >=25){
                        category='Overweight';
                        advice='You should eat less';
                      }
                    });
                  }),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    final random = Random();
                    width = 250 + random.nextInt(350 - 250).toDouble();
                    height = 250 + random.nextInt(350 - 250).toDouble();
                    borderRadius =
                        BorderRadius.circular(random.nextInt(50).toDouble());
                    _updatePadding(padValue == 8.0 ? 20.0 : random.nextInt(20 - 8).toDouble());
                  });
                },
                child: AnimatedPadding(
                  curve: Curves.bounceInOut,
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(padValue),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      gradient: mygradient
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${result==null? '' : result}',
                            style: resultStyle,
                          ),
                          Text(
                            '${result==null? '' : category}',
                            style: categoryStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${result==null? '' : advice}',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: adviceStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

   //Widgets

  Widget ExpandSlider(String s , String path ,String type ,double sliderval  ,double min ,double max){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[300],Colors.black]),
            // color: Colors.cyan,
            borderRadius: BorderRadius.circular(15.0),
          ),
          //color: Colors.cyan,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '$s',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Image(
                      image: AssetImage(path),
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '$sliderval',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '$type',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: 180,
                  height: 180,
                  child: Transform(
                    alignment: FractionalOffset.center,
                    // Rotate sliders by 90 degrees
                    transform: new Matrix4.identity()
                      ..rotateZ(90 * 3.1415927 / 180),
                    child: Slider(
                      activeColor: Colors.yellow,
                      inactiveColor: Colors.black,
                      min: min,
                      max: max,
                      value: type=='CM'? hvalue : wvalue,
                      onChanged: (value) {
                        setState(() {
                         type=='CM'? hvalue = value.roundToDouble(): wvalue = value.roundToDouble();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyListTile(String gender , int vall ){
    return Expanded(
      child: ListTile(
        title: Text("$gender"),
        leading: Radio(
          value: vall,
          groupValue: val,
          onChanged: (value) {
            setState(() {
              value ==2 ? val = value :val=1  ;
            });
          },
          activeColor: Colors.yellow,
        ),
      ),
    );
  }

  //Fun

  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

}
