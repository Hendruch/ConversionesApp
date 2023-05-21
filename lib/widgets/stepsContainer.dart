import 'package:flutter/material.dart';

import 'NeuContainer.dart';

class StepContainer extends StatefulWidget {
  final int index;
  final String equivalencia;
  final String conversion;
   
  const StepContainer({Key? key, required this.index, required this.equivalencia, required this.conversion}) : super(key: key);

  @override
  State<StepContainer> createState() => _StepContainerState();
}

class _StepContainerState extends State<StepContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: NeuContainer(
        shadow: false,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.index != 1? 
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Icon(Icons.arrow_forward_outlined))
                  :Container(height: 25,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.index != 1?
                  Text(widget.equivalencia)
                  : Text(widget.conversion)
                ],
              )
            ],
          ),
        ), 
        borderRadius: BorderRadius.circular(30), 
        padding: const EdgeInsets.all(20),
        backgrounColor: Color(0xFF45505e),
        ),
    );
  }
}