import 'package:app_conversiones/widgets/NeuContainer.dart';
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
          if(selectedValue1 == "Metros" && selectedValue2 == "Metros"){
            
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
                                      selectedValue1 = value;
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
                                      selectedValue2 = value;
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