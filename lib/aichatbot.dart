import 'package:flutter/material.dart';

class AiChatBot extends StatefulWidget {
  const AiChatBot({super.key});

  @override
  _AiChatBotState createState() => _AiChatBotState();
}

class _AiChatBotState extends State<AiChatBot> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  // Predefined responses
  final Map<String, String> _responses = {
    "What is the best season to plant wheat?": "The best season to plant wheat is in the winter or early spring, depending on the region.",
    "How often should crops be watered?": "Crops should be watered based on their specific needs, but most require 1-2 inches of water per week.",
    "What are common pests in farming?": "Common pests include aphids, caterpillars, locusts, and beetles.",
    "How can you tell if soil is healthy?": "Healthy soil is dark, crumbly, rich in nutrients, and has good moisture retention.",
    "Why do plants need sunlight?": "Plants need sunlight for photosynthesis, which helps them produce energy and grow.",
    "What is the use of fertilizers?": "Fertilizers provide essential nutrients like nitrogen, phosphorus, and potassium to help crops grow better.",
    "How can you control weeds on a farm?": "Weeds can be controlled using mulching, hand weeding, herbicides, or crop rotation.",
    "What are the main types of irrigation?": "The main types of irrigation are drip, sprinkler, surface, and subsurface irrigation.",
    "Why do farmers rotate crops?": "Crop rotation prevents soil depletion, reduces pests, and improves soil fertility.",
    "What is organic farming?": "Organic farming avoids synthetic chemicals and focuses on natural fertilizers and pest control methods.",
    "How do farmers store grains safely?": "Grains are stored in silos or airtight containers to protect them from pests, moisture, and mold.",
    "What is the best way to keep soil moist?": "Mulching and drip irrigation are effective ways to retain soil moisture.",
    "Why do some plants grow better in certain soils?": "Different plants require specific nutrients and soil conditions to thrive.",
    "What is greenhouse used for?": "A greenhouse provides a controlled environment to grow plants year-round.",
    "How do bees help in farming?": "Bees help pollinate plants, increasing crop yields and biodiversity.",
    "What are the signs of a sick plant?": "Wilting, yellow leaves, stunted growth, and spots can indicate disease or nutrient deficiency.",
    "Why do farmers test soil?": "Soil testing helps determine nutrient levels and pH, allowing farmers to improve soil health.",
    "What is the best way to protect crops from pests?": "Using natural predators, organic pesticides, and companion planting can help control pests.",
    "How does weather affect farming?": "Weather impacts growth, water availability, and crop health, making forecasting essential.",
    "What tools do farmers use to plant seeds?": "Farmers use seed drills, plows, and planters to sow seeds efficiently."
  };

  void _sendMessage() {
    String userMessage = _controller.text.trim();
    if (userMessage.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'user', 'message': userMessage});
        String botResponse = _responses.containsKey(userMessage)
            ? _responses[userMessage]!
            : "I'm not sure about that. Can you ask something related to farming? 🌱";
        _messages.add({'sender': 'bot', 'message': botResponse});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chatbot'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isUser = _messages[index]['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green[300] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      _messages[index]['message']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ask something about farming...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
