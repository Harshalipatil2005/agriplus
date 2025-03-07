import 'package:flutter/material.dart';

void main() {
  runApp(FarmerBankApp());
}

class FarmerBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FarmerBankPage(), // Directly show the Bank Offers page
    );
  }
}

class FarmerBankPage extends StatelessWidget {
  final List<Map<String, String>> bankOffers = [
    {
      'bank': 'State Bank of India',
      'loan': 'Kisan Credit Card - 7% interest',
      'insurance': 'Crop Insurance - 2% premium',
      'scheme': 'PM Kisan Yojana - ₹6,000/year',
      'logo': 'https://static.india.com/wp-content/uploads/2020/12/SBI.jpg?impolicy=Medium_Widthonly&w=700'
    },
    {
      'bank': 'Punjab National Bank',
      'loan': 'Farm Equipment Loan - 8% interest',
      'insurance': 'Livestock Insurance - 3% premium',
      'scheme': 'PMFBY - Crop Protection',
      'logo': 'https://companieslogo.com/img/orig/PNB.NS_BIG-6ba17682.png?t=1720244493'
    },
    {
      'bank': 'HDFC Bank',
      'loan': 'Agri Gold Loan - 6.5% interest',
      'insurance': 'HDFC Rural Insurance - 2.5% premium',
      'scheme': 'Mukhya Mantri Kisan Yojana',
      'logo': 'https://1000logos.net/wp-content/uploads/2021/06/HDFC-Bank-emblem-768x512.png'
    },
    {
      'bank': 'ICICI Bank',
      'loan': 'Tractor Loan - 7.2% interest',
      'insurance': 'ICICI Lombard Crop Insurance',
      'scheme': 'Rural Development Fund',
      'logo': 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/ICICI_Bank_Logo.svg/456px-ICICI_Bank_Logo.svg.png'
    },
    {
      'bank': 'Axis Bank',
      'loan': 'Kisan Credit Loan - 6.8% interest',
      'insurance': 'Farm Protection Insurance',
      'scheme': 'Gramin Bhandaran Yojana',
      'logo': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/AXISBank_Logo.svg/426px-AXISBank_Logo.svg.png?20130730105224'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Offers for Farmers'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bankOffers.length,
              itemBuilder: (context, index) {
                final bank = bankOffers[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    leading: Image.network(bank['logo']!, width: 50, height: 50),
                    title: Text(bank['bank']!, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Loan: ${bank['loan']}", style: TextStyle(color: Colors.black54)),
                        Text("Insurance: ${bank['insurance']}", style: TextStyle(color: Colors.black54)),
                        Text("Scheme: ${bank['scheme']}", style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmerSchemesPage()),
                );
              },
              child: Text('View Government Schemes'),
            ),
          ),
        ],
      ),
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
