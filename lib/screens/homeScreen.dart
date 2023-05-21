import 'package:app_conversiones/widgets/NeuContainer.dart';
import 'package:app_conversiones/widgets/stepsContainer.dart';
import 'package:flutter/material.dart';

import '../utils/tiposConversion.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String equation = "0";
  String result = "0";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  double d = 0.0;
  int precision = 2;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }else if(buttonText == "b"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
        
      }else if(buttonText == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        if(_appbarTitle == "Longitud"){
          if(selectedValue1 == "Metros"){
            if(selectedValue2 == "Metros"){

            }else if(selectedValue2 == "Pies"){
              d = double.parse(equation) * 3.2808;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Pulgadas"){
              d = double.parse(equation) * 39.37;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Centimetros"){
              d = double.parse(equation) * 100;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Pies"){
            if(selectedValue2 == "Pies"){

            }else if(selectedValue2 == "Metros"){
              d = double.parse(equation) * 0.3048;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Pulgadas"){
              d = double.parse(equation) * 12;
              result = d.toStringAsFixed(8);
            }else if(selectedValue2 == "Centimetros"){
              d = double.parse(equation) * 30.48;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Pulgadas"){
            if(selectedValue2 == "Pulgadas"){

            }else if(selectedValue2 == "Metros"){
              d = double.parse(equation) / 39.37;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Pies"){
              d = double.parse(equation) / 12;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Centimetros"){
              d = double.parse(equation) * 2.54;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Centimetros"){
            if(selectedValue2 == "Centimetros"){

            }else if(selectedValue2 == "Metros"){
              d = double.parse(equation) / 100;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Pies"){
              d = double.parse(equation) / 30.48;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Pulgadas"){
              d = double.parse(equation) / 2.54;
              result = d.toStringAsFixed(precision);
            }
          }
        }else if(_appbarTitle == "Tiempo"){
          if(selectedValue1 == "Horas"){
            if(selectedValue2 == "Horas"){
              
            }else if(selectedValue2 == "Minutos"){
              d = double.parse(equation) * 60;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Segundos"){
              d = double.parse(equation) * 3600;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Minutos"){
            if(selectedValue2 == "Minutos"){
              
            }else if(selectedValue2 == "Horas"){
              d = double.parse(equation) / 60;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Segundos"){
              d = double.parse(equation) * 60;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Segundos"){
            if(selectedValue2 == "Segundos"){
              
            }else if(selectedValue2 == "Horas"){
              d = double.parse(equation) / 3600;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Minutos"){
              d = double.parse(equation) / 60;
              result = d.toStringAsFixed(precision);
            }
          }
        }else if(_appbarTitle == "Masa"){
          if(selectedValue1 == "Kilogramos"){
            if(selectedValue2 == "Kilogramos"){
              
            }else if(selectedValue2 == "Libras"){
              d = double.parse(equation) * 2.20462;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Gramos"){
              d = double.parse(equation) * 1000;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Libras"){
            if(selectedValue2 == "Libras"){
            
            }else if(selectedValue2 == "Kilogramos"){
              d = double.parse(equation) / 2.20462;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Gramos"){
              d = double.parse(equation) * 453.592;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Gramos"){
            if(selectedValue2 == "Gramos"){
            
            }else if(selectedValue2 == "Kilogramos"){
              d = double.parse(equation) / 1000;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Libras"){
              d = double.parse(equation) / 453.592;
              result = d.toStringAsFixed(precision);
            }
          }
        }else if(_appbarTitle == "Área"){
          if(selectedValue1 == "M^2"){
            if(selectedValue2 == "M^2"){
            
            }else if(selectedValue2 == "Hectareas"){
              d = double.parse(equation) / 10000;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Acres"){
              d = double.parse(equation) / 4047;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Hectareas"){
            if(selectedValue2 == "Hectareas"){
            
            }else if(selectedValue2 == "M^2"){
              d = double.parse(equation) * 10000;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Acres"){
              d = double.parse(equation) * 2.417;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Acres"){
            if(selectedValue2 == "Acres"){
            
            }else if(selectedValue2 == "M^2"){
              d = double.parse(equation) * 4047;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Hectareas"){
              d = double.parse(equation) / 2.417;
              result = d.toStringAsFixed(precision);
            }
          }
        }else if(_appbarTitle == "Volumen"){
          if(selectedValue1 == "Litros"){
            if(selectedValue2 == "Litros"){

            }else if(selectedValue2 == "M^3"){
              d = double.parse(equation) / 1000;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Onzas"){
              d = double.parse(equation) * 35.195;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "M^3"){
            if(selectedValue2 == "M^3"){

            }else if(selectedValue2 == "Litros"){
              d = double.parse(equation) * 1000;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "Onzas"){
              d = double.parse(equation) * 35195;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Onzas"){
            if(selectedValue2 == "Onzas"){

            }else if(selectedValue2 == "Litros"){
              d = double.parse(equation) / 35.195;
              result = d.toStringAsFixed(precision);
            }else if(selectedValue2 == "M^3"){
              d = double.parse(equation) / 35195;
              result = d.toStringAsFixed(precision);
            }
          }
        }else if(_appbarTitle == "Velocidad"){
          if(selectedValue1 == "Kmh"){
            if(selectedValue2 == "Kmh"){
              
            }else if(selectedValue2 == "Mph"){
              d = double.parse(equation) / 1.609;
              result = d.toStringAsFixed(precision);
            }
          }else if(selectedValue1 == "Mph"){
            if(selectedValue2 == "Mph"){

            }else if(selectedValue2 == "Kmh"){
              d = double.parse(equation) * 1.609;
              result = d.toStringAsFixed(precision);
            }
          }
        }

      }else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equation == "0"){
          equation = buttonText;
        }else{
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget _buttonRounded({String? title, double padding = 20, IconData? icon, Color? iconColor, Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: NeuContainer(
          child: Container(
            width: padding * 2,
            height: padding * 2,
            child: Center(
              child: (title != null && title != 'b') ? Text(
                '${title}',
                style: TextStyle(
                  color: textColor != null ? textColor : Colors.white,
                  fontSize: 30
                ),
                ):
                Icon(icon, color: iconColor, size: 30,)
            ),
          ), 
          borderRadius: BorderRadius.circular(40), 
          padding: EdgeInsets.all(padding)
        ),
        onTap: () => buttonPressed(title!),
      ),
    );
  }

  String? selectedValue1 = null;
  String? selectedValue2 = null;
  String? auxSelectedValue1 = null;
  String? auxSelectedValue2 = null;

  final _controller = PageController();

  int _selectedConversion = 0;
  String _appbarTitle = "Calculadora";
  List<DropdownMenuItem<String>> _listCmb = [];

  final List<String> _conversion = TiposConversionData.tipos.map((e) => e.nombre).toList();

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF949fad), Color(0xFF272f3a)]
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(_appbarTitle),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),

        //*Barra lateral
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          child: ListView.builder(
            itemCount: _conversion.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_conversion[index]),
                onTap: () {
                  setState(
                    () {
                      _selectedConversion = index;
                      _appbarTitle = _conversion[_selectedConversion];
                      selectedValue1 = null;
                      selectedValue2 = null;
                      _listCmb.clear();
                      _listCmb.addAll(
                      TiposConversionData.tipos[_selectedConversion].unidades.map((e) => DropdownMenuItem(child: Text(e), value: e,),)
                      );
                    },
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _appbarTitle != 'Calculadora'? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //* Dropdown menus
                    children: [
                      Column(
                        children: [

                          NeuContainer(
                            child: Container(
                              width: 110,
                              height: 20,
                              child: Center(
                                child: DropdownButton(
                                  value: selectedValue1,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor: Colors.green,
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                  items: _listCmb, 
                                  onChanged: (value) {
                                    setState(() {
                                      auxSelectedValue1 = selectedValue1;
                                      selectedValue1 = value;
                                      if(selectedValue1 == selectedValue2){
                                        selectedValue2 = auxSelectedValue1;
                                      }
                                    });
                                  },
                                  isExpanded: true,
                                  underline: Container(),
                                  dropdownColor: Color(0xFF374352),
                                ),
                              )
                            ),
                            borderRadius: BorderRadius.circular(40), 
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                          ),
                          
                        ],
                      ),

                      Column(
                        children: [
                          //Text('A', style: TextStyle(fontSize: 25),)
                          Icon(Icons.arrow_forward_outlined, size: 35,)
                        ],
                      ),

                      Column(
                        children: [

                          NeuContainer(
                            child: Container(
                              width: 110,
                              height: 20,
                              child: Center(
                                child: DropdownButton(
                                  value: selectedValue2,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor: Colors.green,
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                  items: _listCmb, 
                                  onChanged: (value) {
                                    setState(() {
                                      auxSelectedValue2 = selectedValue2;
                                      selectedValue2 = value;
                                      if(selectedValue1 == selectedValue2){
                                        selectedValue1 = auxSelectedValue2;
                                      }
                                    });
                                  },
                                  isExpanded: true,
                                  underline: Container(),
                                  dropdownColor: Color(0xFF374352),
                                ),
                              )
                            ),
                            borderRadius: BorderRadius.circular(40), 
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                          ),

                        ],
                      ),

                    ],
                  ),
                ): Container(height: 40,),

                //* Show result
                _appbarTitle != "Calculadora" ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          equation,
                          style: TextStyle(fontSize: equationFontSize),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '=',
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            result,
                            style: TextStyle(fontSize: resultFontSize),
                          )
                        ],
                      )
                    ],
                  ),
                ):Container(),
              
              //* Steps
               _appbarTitle != "Calculadora" ? Container(
                height: 140,
                 child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemCount: 2,
                  itemBuilder: (context, i) {
                    
                    return StepContainer(
                      index: i,
                      equivalencia: '1 ${selectedValue1} es igual a 1000 ${selectedValue2}',
                      conversion: '1 * 1000 = ${result}',
                    );
                  }
              ),
               ): Container(),

                //* Teclado
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buttonRounded(title: '7'),
                          _buttonRounded(title: '8'),
                          _buttonRounded(title: '9'),
                          _buttonRounded(
                            title: 'C',
                            textColor: Colors.green
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buttonRounded(title: '4'),
                          _buttonRounded(title: '5'),
                          _buttonRounded(title: '6'),
                          _buttonRounded(
                            icon: Icons.backspace_outlined,
                            iconColor: Colors.green,
                            title: 'b'
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buttonRounded(title: '1'),
                          _buttonRounded(title: '2'),
                          _buttonRounded(title: '3'),
                          _buttonRounded(
                            title: '=',
                            textColor: Colors.green
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _blankButton(),
                          _buttonRounded(title: '0'),
                          _blankButton(),
                          _buttonRounded(
                            title: '.',
                            textColor: Colors.green
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}



Widget _blankButton({double padding = 20}) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Container(
      width: padding * 2,
      height: padding * 2,
    ),
  );
}