import 'package:flutter/material.dart';

import 'colors_adding.dart';

class second extends StatefulWidget {
  const second({super.key, required this.bmiResult});
  final int bmiResult;

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  var bmiColor = Colors.white;
  var bmiText = 'Normal';
  var imagepath = 'normal';


  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI(){
    var bmi = widget.bmiResult;
    if(bmi<18){
      setState(() {
        bmiColor = Colors.lightBlueAccent;
        bmiText = 'UnderWeight';
        imagepath = 'underweight';
      });
    }

    else if(bmi>=18 && bmi<=25){
      setState(() {
        bmiColor = Colors.green;
        bmiText = 'Normal';
        imagepath = 'normal';
      });
    }

    else if(bmi>=26 && bmi<=30){
      setState(() {
        bmiColor = Colors.yellowAccent;
        bmiText = 'OverWeight';
        imagepath = 'overweight';
      });
    }

    else if(bmi>=31 && bmi<=35){
      setState(() {
        bmiColor = Colors.orange;
        bmiText = 'Obese';
        imagepath = 'obese';
      });
    }

    else {
      setState(() {
        bmiColor = Colors.red;
        bmiText = 'Extreme';
        imagepath = 'exetreme';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0097A7),
      ),
      backgroundColor: Color(0xFF0097A7),
      body: Column(
        children: [
          Container(
            width: width,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFF006064),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your BMI Value is",style: male,),
                Text("${widget.bmiResult}",style: male,),
                Text("${bmiText}",style: male.copyWith(color: bmiColor)),
              ],
            ),
          ),

          Image.asset("assets/images/${imagepath}.png",height: height * 0.5,width: width * 0.8,),

          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(                                       // Use  for Calculate BMI
              padding: const EdgeInsets.all(7.0),
              child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                      child: Text("Calculate Again",style: whitecolor,))),
            ),
          ),
        ],
      ),
    );
  }
}
