import 'package:flutter/material.dart';

/// 👶 HeyBaby – ListView Examples (Babysitter Context)
class HeyBabyListViewExamples {

  /// Simple ListView with static babysitter data
  static Widget simpleListView() {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.child_friendly),
          title: Text('Ananya Sharma'),
          subtitle: Text('Available • ⭐ 4.5'),
        ),
        ListTile(
          leading: Icon(Icons.child_friendly),
          title: Text('Riya Verma'),
          subtitle: Text('Offline • ⭐ 4.2'),
        ),
        ListTile(
          leading: Icon(Icons.child_friendly),
          title: Text('Neha Gupta'),
          subtitle: Text('Available • ⭐ 4.8'),
        ),
      ],
    );
  }

  /// ListView.builder for nearby babysitters
  static Widget builderListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            child: Text('${index + 1}'),
          ),
          title: Text('Babysitter ${index + 1}'),
          subtitle: const Text('3+ years experience • Verified'),
        );
      },
    );
  }

  /// Horizontal ListView for featured babysitters
  static Widget horizontalListView() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.pink[100 * (index + 2)],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Featured ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 🧸 HeyBaby – GridView Examples
class HeyBabyGridViewExamples {

  /// GridView showing babysitting services
  static Widget simpleGridView() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: const [
        _ServiceTile(icon: Icons.schedule, label: 'Full-Day Care'),
        _ServiceTile(icon: Icons.nightlight_round, label: 'Night Care'),
        _ServiceTile(icon: Icons.menu_book, label: 'Homework Help'),
        _ServiceTile(icon: Icons.baby_changing_station, label: 'Infant Care'),
      ],
    );
  }

  /// GridView.builder for dynamic services
  static Widget builderGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Service ${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  /// GridView with custom aspect ratio for trust features
  static Widget customAspectGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.8,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.verified, size: 30),
              SizedBox(height: 4),
              Text('Trusted'),
            ],
          ),
        );
      },
    );
  }
}

/// 🔒 Reusable Service Tile
class _ServiceTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ServiceTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// ⚡ Performance Tips – HeyBaby Context
class HeyBabyScrollablePerformanceTips {

  /// Efficient babysitter list item
  static Widget efficientListItem(
      String name, String status, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.pink,
        child: Text('$index'),
      ),
      title: Text(name),
      subtitle: Text(status),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  /// Optimized grid item for services
  static Widget optimizedGridItem(int index) {
    final color = Colors.primaries[index % Colors.primaries.length];
    final icon = _getIconForIndex(index);

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          const Text('Service', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  static IconData _getIconForIndex(int index) {
    const icons = [
      Icons.child_friendly,
      Icons.schedule,
      Icons.verified,
      Icons.star,
      Icons.location_on,
      Icons.chat,
    ];
    return icons[index % icons.length];
  }
}

/// ❌❌ Common Scrollable Pitfalls (HeyBaby Examples)
class HeyBabyScrollablePitfalls {

  /// ❌ BAD: Loading all babysitters at once
  static Widget badLargeList() {
    return ListView(
      children: List.generate(1000, (index) {
        return ListTile(title: Text('Babysitter $index'));
      }),
    );
  }

  /// ✅ GOOD: Builder for large babysitter list
  static Widget goodLargeList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        return ListTile(title: Text('Babysitter $index'));
      },
    );
  }

  /// ❌ BAD: Nested scroll without control
  static Widget badNestedScrolling() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) =>
                  ListTile(title: Text('Item $index')),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ GOOD: Controlled nested scrolling
  static Widget goodNestedScrolling() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) =>
                  ListTile(title: Text('Item $index')),
            ),
          ),
        ],
      ),
    );
  }
}
