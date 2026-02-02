import 'package:flutter/material.dart';

class ScrollableViews extends StatelessWidget {
  const ScrollableViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HeyBaby – Trusted Childcare'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 Featured Babysitters
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Featured Babysitters',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.pink[100 * ((index % 4) + 2)],
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 30, color: Colors.pink),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Babysitter ${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text('⭐ 4.5 Rating'),
                        const SizedBox(height: 4),
                        const Text(
                          'Verified',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// 🔹 Nearby Babysitters
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Nearby Babysitters',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.primaries[index % Colors.primaries.length],
                      child: const Icon(Icons.child_friendly, color: Colors.white),
                    ),
                    title: Text('Caregiver ${index + 1}'),
                    subtitle: const Text('Available • 3+ years experience'),
                    trailing: Icon(
                      Icons.circle,
                      color: index % 2 == 0 ? Colors.green : Colors.grey,
                      size: 14,
                    ),
                  );
                },
              ),
            ),

            const Divider(thickness: 2),

            /// 🔹 Services Offered
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Services Offered',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 420,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color:
                          Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _serviceIcons[index],
                          size: 40,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _services[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Services Data
final List<String> _services = [
  'Full-Day Care',
  'Night Care',
  'Homework Help',
  'Infant Care',
  'Emergency Care',
  'Special Needs',
];

final List<IconData> _serviceIcons = [
  Icons.schedule,
  Icons.nightlight_round,
  Icons.menu_book,
  Icons.baby_changing_station,
  Icons.warning,
  Icons.favorite,
];
