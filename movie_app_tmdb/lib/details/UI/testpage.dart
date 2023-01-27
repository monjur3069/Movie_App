/*
import 'package:flutter/material.dart';
import '../assets/pictures.dart';
import 'colors.dart';
import 'label_slider.dart';

class HomePageIMG extends StatefulWidget {
  static const String routeName = '/imghome';
  const HomePageIMG({Key? key}) : super(key: key);

  @override
  State<HomePageIMG> createState() => _HomePageIMGState();
}

class _HomePageIMGState extends State<HomePageIMG> {
  late Size size;
  bool _isExpanded = false;
  double AlphaSliderValue = 0;
  double RedSliderValue = 0;
  double GreenSliderValue = 0;
  double BlueSliderValue = 0;
  late Color color;


  @override
  void didChangeDependencies() {
    setColor();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                    cat,
                    fit: BoxFit.fill,
                    color: color,
                    colorBlendMode: BlendMode.color,
                  )),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                bottom: _isExpanded ? 0 : -(size.height/2) + 65,
                child: Container(
                  height: size.height / 2,
                  width: size.width,
                  color: Colors.blue.withOpacity(.3),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      ListTile(
                        title: const Text(
                          'Filter Settings',
                          style: txtWhite,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              setState((){
                                _isExpanded = !_isExpanded;
                              });
                            },
                            icon: Icon(
                              !_isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                              color: Colors.white,
                            )),
                      ),
                      LabelSlider(
                        label: 'Alpha',
                        value: AlphaSliderValue,
                        onChanged: (value){
                          setState((){
                            AlphaSliderValue = value;
                            setColor();
                          });
                        },
                        color: Colors.grey,
                        i_a_c: Colors.blueGrey,
                        a_c: Colors.grey,
                      ),
                      LabelSlider(
                        label: 'Red',
                        value: RedSliderValue,
                        onChanged: (value){
                          setState((){
                            RedSliderValue = value;
                            setColor();
                          });
                        },
                        color: Colors.red,
                        i_a_c: Color.fromARGB(255, 255, 0, 0),
                        a_c: Colors.red,
                      ),
                      LabelSlider(
                        label: 'Green',
                        value: GreenSliderValue,
                        onChanged: (value){
                          setState((){
                            GreenSliderValue = value;
                            setColor();
                          });
                        },
                        color: Colors.green,
                        i_a_c: Color.fromARGB(255, 53, 255, 1),
                        a_c: Colors.green,
                      ),
                      LabelSlider(
                        label: 'Blue',
                        value: BlueSliderValue,
                        onChanged: (value){
                          setState((){
                            BlueSliderValue = value;
                            setColor();
                          });
                        },
                        color: Colors.blue,
                        i_a_c: Color.fromARGB(255, 0, 14, 112),
                        a_c: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  setColor(){
    color = Color.fromARGB(AlphaSliderValue.round(), RedSliderValue.round(), GreenSliderValue.round(), BlueSliderValue.round());
  }
}
*/
