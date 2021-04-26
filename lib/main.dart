import './style_and_constant.dart';
import './color.dart';
import './brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(MyApp());
}

Gender selectedGender;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text('BMI CALCULATOR')),
          ),
          body: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int age = 13;
  int height = 120;
  int weight = 40;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              ContainerCard(
                h: 0.3,
                w: 0.65,
                childwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Text(
                        'GENDER',
                        style: TextStyle(
                          color: chooenColor(selectedGender),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: GenderIcon(
                            icon: IconTheme(
                              data: IconThemeData(
                                color: selectedGender == Gender.male
                                    ? MaleButtonEnable
                                    : DisableButton,
                              ),
                              child: Icon(
                                FontAwesomeIcons.mars,
                                size: 80,
                              ),
                            ),
                            label: 'MALE',
                            ontap: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                          ),
                        ),
                        Container(
                          child: GenderIcon(
                            icon: IconTheme(
                              data: IconThemeData(
                                color: selectedGender == Gender.female
                                    ? FemaleButtonEnable
                                    : DisableButton,
                              ),
                              child: Icon(
                                FontAwesomeIcons.venus,
                                size: 80,
                              ),
                            ),
                            label: 'FEMALE',
                            ontap: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ContainerCard(
                h: 0.3,
                w: 0.26,
                childwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: TextStyle(
                        color: chooenColor(selectedGender),
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {
                        setState(() {
                          age++;
                        });
                      },
                      child: IconTheme(
                        data: IconThemeData(
                          size: 38,
                          color: chooenColor(selectedGender),
                        ),
                        child: Icon(
                          Icons.arrow_drop_up,
                        ),
                      ),
                    ),
                    Text(
                      '$age',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          age--;
                        });
                      },
                      child: IconTheme(
                        data: IconThemeData(
                          size: 38,
                          color: chooenColor(selectedGender),
                        ),
                        child: Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ContainerCard(
            w: 1,
            h: 0.22,
            childwidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WEIGHT',
                  style: TextStyle(
                    color: chooenColor(selectedGender),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  child: NumberPicker.horizontal(
                      itemExtent: 100,
                      initialValue: weight,
                      minValue: 20,
                      maxValue: 125,
                      selectedTextStyle: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      ),
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'kg',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ContainerCard(
            w: 1,
            h: 0.2,
            childwidget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'HEIGHT',
                  style: TextStyle(
                    color: chooenColor(selectedGender),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$height',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '  cm',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: chooenColor(selectedGender),
                    inactiveColor: chooenColor(selectedGender),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    }),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.08,
          child: FlatButton(
            color: selectedGender == Gender.male
                ? MaleButtonEnable
                : selectedGender == Gender.female
                    ? FemaleButtonEnable
                    : Colors.black,
            padding: EdgeInsets.all(15),
            child: Text(
              'CALCULATE',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Brain brain = new Brain(height: height, weight: weight);
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  context: context,
                  builder: (_) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your Health',
                            style: TextStyle(
                              color: chooenColor(selectedGender),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Text(
                            brain.answer(),
                            style: TextStyle(
                              color: chooenColor(selectedGender),
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            brain.gethealthlable(),
                            style: TextStyle(
                              color: chooenColor(selectedGender),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            brain.getadvice(),
                            style: TextStyle(
                              fontSize: 18,
                              color: chooenColor(selectedGender),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
