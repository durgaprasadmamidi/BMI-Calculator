import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/ReusableCard.dart';
import '../components/IconContent.dart';
import '../components/RoundIconButton.dart';
import '../components/BottomButton.dart';
import '../constants.dart';
import 'package:bmi_calculator/calculateBrain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedColor = Gender.male;
                        });
                      },
                      colour: selectedColor == Gender.male
                          ? KActivecardColor
                          : KInactivecardColor,
                      childCard: IconContent(
                          cardIcon: FontAwesomeIcons.mars, cardText: 'MALE'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedColor = Gender.female;
                        });
                      },
                      colour: selectedColor == Gender.female
                          ? KActivecardColor
                          : KInactivecardColor,
                      childCard: IconContent(
                          cardIcon: FontAwesomeIcons.venus, cardText: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: KInactivecardColor,
                childCard: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: KTextStyle,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(Height.toString(), style: KTextStyleB),
                          Text(
                            'cm',
                            style: KTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                        ),
                        child: Slider(
                          min: 120,
                          max: 220,
                          value: Height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              Height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      colour: KInactivecardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: KTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: KTextStyleB,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: ReusableCard(
                        colour: KInactivecardColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: KTextStyle,
                            ),
                            Text(
                              Age.toString(),
                              style: KTextStyleB,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      Age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      Age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
//            BottomButton(
//              label: 'Calculate',
//              onPress: () {
//                CalculatorBrain calc =
//                    CalculatorBrain(weight: weight, height: Height);
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => resultsPage(
//                              result: calc.getResult(),
//                              interpritation: calc.getInterpretation(),
//                              bmi: calc.calculateBMI(),
//                            )));
//              },
//            )

            BottomButton(
              label: 'CALCULATE',
              onPress: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: Height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultsPage(
                      bmi: calc.calculateBMI(),
                      result: calc.getResult(),
                      interpritation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
