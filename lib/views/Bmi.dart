import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _Bmistate createState() => _Bmistate();
}

class _Bmistate extends State<Bmi> {
  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();
  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bmi Calculator'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightcontroller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                  labelText: 'Enter Your Height in Cms',
                  icon: Icon(Icons.trending_up)),
            ),
            const SizedBox(
              height: 20,
              width: null,
            ),
            TextField(
              controller: _weightcontroller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Enter Your weight Kgs',
                icon: Icon(Icons.line_weight),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            ElevatedButton(
              child: const Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
              onPressed: calculateBMI,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Calculated Bmi",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize:20,
                fontWeight: FontWeight.w600,

              ),
            ),
            ElevatedButton(
              child:  Text(
                _result == null?"Enter value": "${_result?.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
              onPressed: calculateBMI,
            ),

            const Image(
              image: AssetImage('assets/BMIScale.jpg'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ad_units_outlined,
                color: Colors.transparent,
              ),
              label: '',
              backgroundColor: Colors.transparent),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.ad_units_outlined,
                color: Colors.transparent,
              ),
              label: '',
              backgroundColor: Colors.white),
        ],
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightcontroller.text) / 100;
    double weight = double.parse(_weightcontroller.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }
}
