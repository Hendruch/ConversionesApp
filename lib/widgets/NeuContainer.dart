import 'package:flutter/material.dart';

const Color colorDark = Color(0xFF374352);

class NeuContainer extends StatefulWidget {

  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
   
  const NeuContainer({Key? key, required this.child, required this.borderRadius, required this.padding}) : super(key: key);

  @override
  State<NeuContainer> createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {

  bool isPressed = false;

  void _onPointerDown(PointerDownEvent event){
    setState(() {
      isPressed = true;
    });
  }
  
  void _onPointerUp(PointerUpEvent event){
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: colorDark,
          borderRadius: widget.borderRadius,
          boxShadow: isPressed
          ? null
          : [
            const BoxShadow(
              color: Colors.black54,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0
            ),
            BoxShadow(
              color: Colors.blueGrey.shade700,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0
            ),
          ]
        ),
        child: widget.child,
      ),
    );
  }
}