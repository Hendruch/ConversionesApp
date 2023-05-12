import 'package:app_conversiones/widgets/NeuContainer.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? selectedValue1 = null;
  String? selectedValue2 = null;

  //TODO: Crear las listas de DropDownMenuItem para cada tipo de unidad y que cambien con forme a la unidad seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(
              child: const Text('Longitud'),
              onTap: () {
                
              },
            ),
            PopupMenuItem(
              child: const Text('Tiempo'),
              onTap: () {
                
              },
            ),
            PopupMenuItem(
              child: const Text('Masa'),
              onTap: () {
                
              },
            ),
            PopupMenuItem(
              child: const Text('Área'),
              onTap: () {
                
              },
            ),
            PopupMenuItem(
              child: const Text('Volumen'),
              onTap: () {
                
              },
            ),
            PopupMenuItem(
              child: const Text('Velocidad'),
              onTap: () {
                
              },
            ),
          ])
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        DropdownButton(
                          value: selectedValue1,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.green,
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                          items: const [
                            DropdownMenuItem(child: Text('Metros'), value: 'Metro',),
                            DropdownMenuItem(child: Text('Pies'), value: 'Pies',),
                            DropdownMenuItem(child: Text('Pulgadas'), value: 'Pulgadas',),
                            DropdownMenuItem(child: Text('Centimetros'), value: 'Centimetros',),
                          ], 
                          onChanged: (value) {
                            setState(() {
                              selectedValue1 = value;
                            });
                          }
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('A')
                      ],
                    ),
                    Column(
                      children: [
                        DropdownButton(
                          value: selectedValue2,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.green,
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                          items: const [
                            DropdownMenuItem(child: Text('Metros'), value: 'Metro',),
                            DropdownMenuItem(child: Text('Pies'), value: 'Pies',),
                            DropdownMenuItem(child: Text('Pulgadas'), value: 'Pulgadas',),
                            DropdownMenuItem(child: Text('Centimetros'), value: 'Centimetros',),
                          ], 
                          onChanged: (value) {
                            setState(() {
                              selectedValue2 = value;
                            });
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '6.05',
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '=',
                          style: TextStyle(fontSize: 35),
                        ),
                        Text(
                          '10*15+12',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
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
                          iconColor: Colors.greenAccent
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
                          title: ',',
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
    );
  }
}

Widget _buttonRounded({String? title, double padding = 20, IconData? icon, Color? iconColor, Color? textColor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: NeuContainer(
      child: Container(
        width: padding * 2,
        height: padding * 2,
        child: Center(
          child: title != null ? Text(
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
  );
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