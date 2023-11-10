import 'package:calculator_with_riverpod/constants.dart';
import 'package:calculator_with_riverpod/provider/calculation_provider.dart';
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Shape {
  square,
  circle,
  stadium,
}

class CalculatorButton extends ConsumerStatefulWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final Shape shape;
  const CalculatorButton(
      {super.key,
      required this.text,
      this.textColor = darkGrey,
      this.fontSize = 40,
      this.width = 0,
      this.fontWeight = FontWeight.bold,
      this.shape = Shape.square});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CalculatorButtonState();
}

class _CalculatorButtonState extends ConsumerState<CalculatorButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {

   var size = MediaQuery.of(context).size;
   double width = size.width;
   double height = size.height;

    final borderRadius = widget.shape == Shape.circle
        ? null
        : BorderRadius.circular(widget.shape == Shape.square ? 20 : 36);

        final shape = widget.shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle;
    return Listener(
      onPointerDown: (event) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (event) => setState(() {
        isPressed = false;

        final provider = ref.read(calculationProvider.notifier);
        if(widget.shape == Shape.square){
          provider.addSign(widget.text);
        }else{
                    provider.addNumber(widget.text);

        }
      }),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        width: width*0.135,
        height: height*0.1,
        decoration: BoxDecoration(borderRadius: borderRadius,
        shape: shape,
        color: lightGrey,
        boxShadow: [
          BoxShadow(
          offset: const Offset(-2, -2),
          blurRadius: 5,
          color: const Color(0x80FFFFFF),
          inset: isPressed
        ,),
        BoxShadow(
          offset: const Offset(2, 2),
          blurRadius: 5,
          color: const Color(0x08083e9e),
          inset: isPressed
        ,),
        BoxShadow(
          offset: const Offset(2, 2),
          blurRadius: 5,
          color: isPressed ? Colors.transparent : const Color(0xCCFFFFFF),
          inset: true,
        ),
        BoxShadow(
          offset: const Offset(-2, -2),
          blurRadius: 5,
          color: isPressed ? Colors.transparent : const Color(0x66838E9E),
          inset: true,
        ),
        ]
        ),
        child: Center(
          child: Text(widget.text, 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.textColor
          ),
          ),
        ),
        
      ),
    );
  }
}
