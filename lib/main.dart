import 'package:bmi_names/second_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'colors_adding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title,});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int heightSlider = 120;
  int age = 25;
  int weight = 45;


  void calculateBMI(){
    var heightInMetter = heightSlider / 100;
    var bmi = weight / (heightInMetter * heightInMetter);
    print(bmi.round());
    Navigator.push(context, MaterialPageRoute(builder: (context)=>second(bmiResult:bmi.round(),)));
  }


  Color maleColour = Color(0xFF006064);
  Color femaleColour = Color(0xFF033366);

  void selectGender(bool gender){
    if(gender){
      setState(() {
        maleColour = blueColor;
        femaleColour = selectedColor;
      });
    }
    else{
      setState(() {
        femaleColour = blueColor;
        maleColour = selectedColor;
      });
    }
  }


  addSubAge(bool Ageadd){
    if(Ageadd){
      setState(() {
        age++;
      });
    }
    else{
      setState(() {
        age--;
      });
    }
  }

  addSubWeight(bool Weightadd){
    if(Weightadd){
      setState(() {
        weight++;
      });
    }
    else{
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator",style: whitecolor,)),
        backgroundColor: Color(0xFF0097A7),
      ),
      backgroundColor: Color(0xFF0097A7),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Row(                                               // Use Row
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectGender(true);
                          });
                        },
                        child: reusableUI(
                          Colour: maleColour,
                            childCard:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FaIcon(FontAwesomeIcons.mars,size: 80,color: Colors.white,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Male",style: male),
                                ),
                              ],
                            ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectGender(false);
                          });
                        },
                        child: reusableUI(
                          Colour: femaleColour,
                          childCard: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FaIcon(FontAwesomeIcons.venus,
                                  size: 80,color: Colors.white,),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Famale",style: male),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              Expanded(                                    // Use for height,cm and Slider
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: reusableUI(
                    childCard: Column(                                       // Use Column
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Height",style: male,),

                        Row(                                                  // use Row
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${heightSlider} ",style: male,),
                            Text("cm",style: male,),
                          ],
                        ),

                        Slider(
                          min: 120,
                          max: 200,
                          value: heightSlider.toDouble(),
                          activeColor: Colors.white,
                          inactiveColor: Colors.white70,
                          thumbColor: Colors.orange,
                          onChanged: (double value){
                            setState(() {
                              heightSlider = value.toInt();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Row(                                          // Use Row
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: reusableUI(
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Age",style: male),
                            Text("${age}",style: male),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: RoundButton(icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        addSubAge(true);
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: RoundButton(icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        addSubAge(false);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: reusableUI(
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Weight",style: male),
                            Text("${weight}",style: male),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: RoundButton(icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        addSubWeight(true);
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: RoundButton(icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      addSubWeight(false);
                                    });
                                  },),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: (){
                  calculateBMI();
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
                          child: Text("Calculate BMI",style: whitecolor,))),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}


class RoundButton extends StatefulWidget {
  const RoundButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  State<RoundButton> createState() => _RoundedButtonState();
}
class _RoundedButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(widget.icon),
      onPressed: widget.onPressed,
      elevation: 6.0,
      constraints: const BoxConstraints(minWidth: 50, minHeight: 50,),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
    );
  }
}


class reusableUI extends StatelessWidget {
  const reusableUI({super.key, required this.childCard, this.Colour,});
  final Widget childCard;
  final Colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colour ?? const Color(0xFF006064),
        borderRadius: BorderRadius.circular(11),
      ),
      child: childCard,
    );
  }
}
