import 'package:flutter/material.dart';
import 'package:agri_app/home_page.dart';
void main() {
  runApp(const BiogasCalculatorApp());
}

class BiogasCalculatorApp extends StatelessWidget {
  const BiogasCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biogas Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const BiogasCalculatorPage(),
    );
  }
}

class BiogasCalculatorPage extends StatefulWidget {
  const BiogasCalculatorPage({super.key});

  @override
  State<BiogasCalculatorPage> createState() => _BiogasCalculatorPageState();
}

class _BiogasCalculatorPageState extends State<BiogasCalculatorPage> {
  final TextEditingController _quintalController = TextEditingController();
  double _biogasOutput = 0.0;
  double _pricePerQuintal = 0.0;
  String _selectedCrop = '';

  final Map<String, double> cropEfficiency = {
    'Corn Stalk': 50,
    'Wheat Straw': 35,
    'Sugarcane Bagasse': 45,
    'Rice Husk': 30,
  };

  final Map<String, double> moistureContent = {
    'Corn Stalk': 0.25,
    'Wheat Straw': 0.15,
    'Sugarcane Bagasse': 0.40,
    'Rice Husk': 0.10,
  };

  void _calculateBiogas() {
    if (_selectedCrop.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a crop type.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_quintalController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the compost crop quantity.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      double quintal = double.tryParse(_quintalController.text) ?? 0;
      double efficiency = cropEfficiency[_selectedCrop] ?? 40;
      double moisture = moistureContent[_selectedCrop] ?? 0.2;
      _biogasOutput = quintal * efficiency * (1 - moisture);
      _pricePerQuintal = quintal * 500;
    });
  }

  @override
  void dispose() {
    _quintalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biogas Calculator',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context); // Go back if possible
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()), // Ensure HomePage exists
              );
            }
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Calculate Biogas Output & Farmer Price',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedCrop.isEmpty ? null : _selectedCrop,
                  decoration: InputDecoration(
                    labelText: 'Select Crop Type',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.green[50],
                  ),
                  items: cropEfficiency.keys.map((crop) {
                    return DropdownMenuItem<String>(
                      value: crop,
                      child: Text(crop),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCrop = value ?? '';
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _quintalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter compost crop (quintal)',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.green[50],
                    prefixIcon: const Icon(Icons.agriculture, color: Colors.green),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateBiogas,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Calculate', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 6, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Estimated Biogas Output: $_biogasOutput cubic meters',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Price for Farmers: ₹$_pricePerQuintal',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
