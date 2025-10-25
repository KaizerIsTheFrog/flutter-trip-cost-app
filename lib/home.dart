import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController distanceTxtController = TextEditingController();
  TextEditingController carFuelEffTxtController = TextEditingController();
  TextEditingController fuelPriceTxtController = TextEditingController();
  TextEditingController fuelCostTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
        "Trip Fuel Cost Estimator", 
        style: TextStyle(color: Colors.white),
        ),
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset("assets/trip_logo.png"),
                  SizedBox(height: 5),
                  TextField(
                    controller: distanceTxtController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Distance (km)',
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                      ),
                      )
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: carFuelEffTxtController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Car Fuel Efficiency (km/L)',
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                      ),
                      )
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: fuelPriceTxtController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Fuel Price (RM/L)',
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                      ),
                      )
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateFuelCost();
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(color: Colors.blue),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: fuelCostTxtController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Fuel Cost (L)',
                      border: OutlineInputBorder()
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(64),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void calculateFuelCost() {
    bool errorExist = false;
    double distance = 0.0;
    double carFuelEff = 0.0;
    double fuelPrice = 0.0;
    double fuelCost = 0.0;

    try {
      distance = double.parse(distanceTxtController.text.trim());
      carFuelEff = double.parse(carFuelEffTxtController.text.trim());
      fuelPrice = double.parse(fuelPriceTxtController.text.trim());
    } on FormatException {
      SnackBar snackBar = const SnackBar(
        content: Text("Input is not numerical. Please try again."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      errorExist = true;
    }

    if ((distance <= 0.0 || carFuelEff <= 0.0 || fuelPrice <= 0.0) && errorExist == false) {
      SnackBar snackBar = const SnackBar(
        content: Text("Input should not be less than 0.1. Please try again."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      errorExist = true;
      return;
    }

     if (errorExist == false) {
      setState(() {
        fuelCost = (distance / carFuelEff) * fuelPrice;
        fuelCostTxtController.text = fuelCost.toString();
      });
     }
    
  }
}

