import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
const BMICalculator({Key? key}) : super(key: key);

@override
_BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  
  double result = 0;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  var mainResult = TextEditingController();

  calculateBMI (String weight, String height) async{
	var doubleWeight = double.parse(weight);
	var doubleHeight = double.parse(height);

	var res = (doubleWeight / (doubleHeight * doubleHeight));

	setState(() {
	mainResult.text = res.toStringAsFixed(2);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        elevation: 0,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "BMI: " + mainResult.text,
                style: const TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: weightController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Enter weight(kg)",
                  hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                ),
              ),
                  keyboardType: 
                      const TextInputType.numberWithOptions(decimal: true),
        ),
            ),
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: heightController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Height (m)",
                  hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                ),
              ),
                  keyboardType: 
                      const TextInputType.numberWithOptions(decimal: true),
        ),
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
             onPressed:() {
                calculateBMI(weightController.text, heightController.text);
             }, 
              style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),
             child: const Text("Calculate",
                  style: TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                  ),
            )),
        ), 
          ],
        ),
      ),
    );
  }
}
