import 'package:calculator_with_riverpod/screens/components/calculation_text.dart';
import 'package:calculator_with_riverpod/screens/components/calculator_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Widget> get row1 => [
      const CalculatorButton(text: 'C', 
      textColor: Color(0xFFB94D2B),
      ),

      const CalculatorButton(text: 'del',
      fontSize: 27,
      ),
      const CalculatorButton(text: '%',
      fontSize: 32,
      ),
      const CalculatorButton(text: '\u00F7',
      fontSize: 44,
      )
    ];

    List<Widget> get row2 => [
      for(final i in ['1', '2', '3'])
      CalculatorButton(text: i, shape: Shape.circle,),
      const CalculatorButton(text: '\u00D7',
      fontWeight: FontWeight.normal,
      fontSize: 52,
       )
    ];

    List<Widget> get row3 => [
      for(final i in ['4', '5', '6'])
      CalculatorButton(text: i, shape: Shape.circle,),
      const CalculatorButton(text: '\u2212', fontSize: 44,)
    ];

    List<Widget> get row4 => [
      for(final i in ['7', '8', '9'])
      CalculatorButton(text: i, shape: Shape.circle,),
      const CalculatorButton(text: '+', )
    ];
    List<Widget> get row5 => [
     const CalculatorButton(text: '0',
     shape: Shape.stadium,
     width: 170,
     ),
     const CalculatorButton(text: '.',
     
     ),
      const CalculatorButton(text: '=', )
    ];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    final rows = [row1, row2, row3, row4,row5];
    return Scaffold(
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             SizedBox(height: height*0.1,),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: CalculationText(),
            ),
            const Spacer(),
             ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
            
            separatorBuilder:(context, index) =>  SizedBox(height: height*0.03,),
            itemCount: rows.length,
            itemBuilder: (context, index) =>  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: rows[index],
                ),
            ),
             SizedBox(height: height*0.07,)
          ],
        )
        
        
       
    
    );
  }
}
