import 'package:flutter/material.dart';

void main() {
  runApp(FarmerSchemesApp());
}

class FarmerSchemesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: FarmerSchemesPage(),
    );
  }
}

class FarmerSchemesPage extends StatefulWidget {
  @override
  _FarmerSchemesPageState createState() => _FarmerSchemesPageState();
}

class _FarmerSchemesPageState extends State<FarmerSchemesPage> {
  final List<Map<String, dynamic>> governmentSchemes = [
    {
      'name': 'PM-KISAN',
      'benefit': '₹6,000 per year for small farmers',
      'eligibility': 'Small and marginal farmers',
      'details': 'Direct income support in three equal installments.',
      'icon': Icons.agriculture,
    },
    {
      'name': 'PMFBY',
      'benefit': 'Crop insurance at low premium rates',
      'eligibility': 'All farmers growing notified crops',
      'details': 'Financial support for crop loss due to calamities.',
      'icon': Icons.shield,
    },
    {
      'name': 'Kisan Credit Card',
      'benefit': 'Easy loans at low interest rates',
      'eligibility': 'Farmers, fishers, and animal husbandry workers',
      'details': 'Credit for crop production and agricultural activities.',
      'icon': Icons.credit_card,
    },
    {
      'name': 'eNAM',
      'benefit': 'Online platform for selling produce',
      'eligibility': 'Registered farmers',
      'details': 'Sell produce at competitive prices online.',
      'icon': Icons.store,
    },
    {
      'name': 'RKVY',
      'benefit': 'Financial aid for agricultural development',
      'eligibility': 'Farmers and agri-entrepreneurs',
      'details': 'Supports agricultural and allied sector projects.',
      'icon': Icons.attach_money,
    },
    {
      'name': 'Gramin Bhandaran Yojana',
      'benefit': 'Subsidy for warehouse construction',
      'eligibility': 'Farmers and agribusinesses',
      'details': 'Financial assistance for storage infrastructure.',
      'icon': Icons.warehouse,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Govt. Schemes for Farmers', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: governmentSchemes.length,
          itemBuilder: (context, index) {
            final scheme = governmentSchemes[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                leading: Icon(scheme['icon'], size: 40, color: Colors.green),
                title: Text(scheme['name']!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\u2022 Benefit: ${scheme['benefit']}",
                            style: TextStyle(color: Colors.black87)),
                        SizedBox(height: 4),
                        Text("\u2022 Eligibility: ${scheme['eligibility']}",
                            style: TextStyle(color: Colors.black87)),
                        SizedBox(height: 4),
                        Text("\u2022 Details: ${scheme['details']}",
                            style: TextStyle(color: Colors.black87)),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Applied for ${scheme['name']}")),
                            );
                          },
                          child: Text("Apply Now"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}