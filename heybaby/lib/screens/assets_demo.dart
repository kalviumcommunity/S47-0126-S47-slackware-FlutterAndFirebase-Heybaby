import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// AssetsDemoScreen - Demonstrates how to work with Flutter assets
/// 
/// This screen showcases:
/// 1. Displaying images from assets using Image.asset()
/// 2. Using built-in Material Design icons
/// 3. Using iOS-style Cupertino icons
/// 4. Combining images and icons in layouts
/// 5. Using images as backgrounds
/// 6. Responsive asset sizing
class AssetsDemoScreen extends StatefulWidget {
  const AssetsDemoScreen({super.key});

  @override
  State<AssetsDemoScreen> createState() => _AssetsDemoScreenState();
}

class _AssetsDemoScreenState extends State<AssetsDemoScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets Management Demo'),
        backgroundColor: Colors.blueAccent,
        elevation: 8,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1: Introduction
              _buildSectionTitle('Understanding Assets'),
              _buildIntroductionSection(),
              const SizedBox(height: 24),

              // Section 2: Asset Folder Structure
              _buildSectionTitle('Asset Folder Organization'),
              _buildFolderStructureSection(),
              const SizedBox(height: 24),

              // Section 3: Material Icons Gallery
              _buildSectionTitle('Material Design Icons'),
              _buildMaterialIconsSection(),
              const SizedBox(height: 24),

              // Section 4: Cupertino Icons Gallery
              _buildSectionTitle('iOS-Style Cupertino Icons'),
              _buildCupertinoIconsSection(),
              const SizedBox(height: 24),

              // Section 5: Image Loading Examples
              _buildSectionTitle('Image.asset() Examples'),
              _buildImageLoadingSection(),
              const SizedBox(height: 24),

              // Section 6: Image as Background
              _buildSectionTitle('Image as Background Container'),
              _buildBackgroundImageSection(),
              const SizedBox(height: 24),

              // Section 7: Responsive Asset Sizing
              _buildSectionTitle('Responsive Asset Sizing'),
              _buildResponsiveSizingSection(),
              const SizedBox(height: 24),

              // Section 8: Icon Sizing Guide
              _buildSectionTitle('Icon Sizing Best Practices'),
              _buildIconSizingGuide(),
              const SizedBox(height: 24),

              // Section 9: Troubleshooting
              _buildSectionTitle('Common Asset Issues & Fixes'),
              _buildTroubleshootingSection(),
              const SizedBox(height: 24),

              // Section 10: pubspec.yaml Reference
              _buildSectionTitle('pubspec.yaml Configuration'),
              _buildPubspecReference(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(
            color: Colors.blueAccent,
            width: 4,
          ),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildIntroductionSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint(
            'Images: PNG, JPG, SVG, GIF files for logos, banners, backgrounds',
          ),
          _buildBulletPoint(
            'Icons: Material Design icons, Cupertino icons, or custom icon files',
          ),
          _buildBulletPoint(
            'Fonts: Custom fonts for enhanced typography',
          ),
          _buildBulletPoint(
            'Registration: All assets must be declared in pubspec.yaml',
          ),
          _buildBulletPoint(
            'Best Practice: Organize into separate folders (images/, icons/)',
          ),
        ],
      ),
    );
  }

  Widget _buildFolderStructureSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black.withOpacity(0.08),
            padding: const EdgeInsets.all(12),
            borderRadius: BorderRadius.circular(6),
            child: const Text(
              '''assets/
├── images/
│   ├── logo.png
│   ├── banner.jpg
│   └── background.png
└── icons/
    ├── star.png
    ├── profile.png
    └── heart.png''',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '✅ Keep related assets together in focused folders',
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
          const SizedBox(height: 4),
          const Text(
            '✅ Use clear, descriptive file names (e.g., logo_dark.png)',
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialIconsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Material Icons - Built-in Flutter icons (no registration needed)',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconDemo(
                Icons.home,
                'home',
              ),
              _buildIconDemo(
                Icons.favorite,
                'favorite',
              ),
              _buildIconDemo(
                Icons.star,
                'star',
              ),
              _buildIconDemo(
                Icons.search,
                'search',
              ),
              _buildIconDemo(
                Icons.settings,
                'settings',
              ),
              _buildIconDemo(
                Icons.notifications,
                'notifications',
              ),
              _buildIconDemo(
                Icons.account_circle,
                'account_circle',
              ),
              _buildIconDemo(
                Icons.image,
                'image',
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            color: Colors.blue.withOpacity(0.1),
            padding: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(4),
            child: const Text(
              'Tip: Use Icons.* for Material Design icons. They\'re instantly available without registration!',
              style: TextStyle(fontSize: 11, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCupertinoIconsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cupertino Icons - iOS-style icons (from cupertino_icons package)',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconDemo(
                CupertinoIcons.home,
                'home',
                isCupertino: true,
              ),
              _buildIconDemo(
                CupertinoIcons.heart,
                'heart',
                isCupertino: true,
              ),
              _buildIconDemo(
                CupertinoIcons.star,
                'star',
                isCupertino: true,
              ),
              _buildIconDemo(
                CupertinoIcons.search,
                'search',
                isCupertino: true,
              ),
              _buildIconDemo(
                CupertinoIcons.settings,
                'settings',
                isCupertino: true,
              ),
              _buildIconDemo(
                CupertinoIcons.bell,
                'bell',
                isCupertino: true,
              ),
              _buildIconDemo(
                CupertinoIcons.profile_circled,
                'profile',
                isCupertino: true,
              ),
              _buildIconDemo(
                CupertinoIcons.photo,
                'photo',
                isCupertino: true,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            color: Colors.orange.withOpacity(0.1),
            padding: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(4),
            child: const Text(
              'Tip: Import "package:flutter/cupertino.dart" to use CupertinoIcons',
              style: TextStyle(fontSize: 11, color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageLoadingSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Image.asset() Syntax Examples',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildCodeExample(
            'Basic image loading:',
            '''Image.asset(
  'assets/images/logo.png',
  width: 150,
  height: 150,
  fit: BoxFit.cover,
)''',
          ),
          const SizedBox(height: 12),
          _buildCodeExample(
            'With error handling:',
            '''Image.asset(
  'assets/images/logo.png',
  width: 150,
  errorBuilder: (context, error, stackTrace) {
    return Text('Image failed to load');
  },
)''',
          ),
          const SizedBox(height: 12),
          _buildCodeExample(
            'Responsive sizing:',
            '''Image.asset(
  'assets/images/logo.png',
  width: MediaQuery.of(context).size.width * 0.5,
  fit: BoxFit.contain,
)''',
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImageSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCodeExample(
            'Using Image as Background:',
            '''Container(
  height: 200,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.png'),
      fit: BoxFit.cover,
    ),
  ),
  child: Center(
    child: Text(
      'Overlay Text',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)''',
          ),
          const SizedBox(height: 12),
          // Actual example
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent, width: 2),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.image,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Background Image Container',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Add your image here',
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveSizingSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCodeExample(
            'Responsive image sizing:',
            '''double imageWidth = MediaQuery.of(context).size.width;

Image.asset(
  'assets/images/logo.png',
  width: imageWidth > 600 ? 300 : 150,
  fit: BoxFit.contain,
)''',
          ),
          const SizedBox(height: 16),
          _buildBulletPoint('Use MediaQuery for screen-aware sizing'),
          _buildBulletPoint('Fit options: cover, contain, fill, fitHeight, fitWidth'),
          _buildBulletPoint('Consider different device sizes (phone, tablet)'),
        ],
      ),
    );
  }

  Widget _buildIconSizingGuide() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIconSizeDemo(18, 'Tiny (18)'),
          const SizedBox(height: 12),
          _buildIconSizeDemo(24, 'Small (24)'),
          const SizedBox(height: 12),
          _buildIconSizeDemo(32, 'Medium (32)'),
          const SizedBox(height: 12),
          _buildIconSizeDemo(48, 'Large (48)'),
          const SizedBox(height: 12),
          _buildIconSizeDemo(64, 'Extra Large (64)'),
        ],
      ),
    );
  }

  Widget _buildTroubleshootingSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTroubleshootItem(
            '❌ Missing Asset Box (red square)',
            '✅ Ensure the file path matches exactly. Check pubspec.yaml registration.',
          ),
          const SizedBox(height: 12),
          _buildTroubleshootItem(
            '❌ YAML Indentation Error',
            '✅ Use exactly 2 spaces (not tabs) for every indentation level.',
          ),
          const SizedBox(height: 12),
          _buildTroubleshootItem(
            '❌ Assets not found after hot reload',
            '✅ Run "flutter pub get" and restart the app completely.',
          ),
          const SizedBox(height: 12),
          _buildTroubleshootItem(
            '❌ Image.asset() throws exception',
            '✅ Verify the path in pubspec.yaml and code match exactly.',
          ),
          const SizedBox(height: 12),
          _buildTroubleshootItem(
            '❌ Unregistered asset folder',
            '✅ Add "- assets/your_folder/" under flutter: assets: in pubspec.yaml',
          ),
        ],
      ),
    );
  }

  Widget _buildPubspecReference() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Required pubspec.yaml Configuration:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            color: Colors.black.withOpacity(0.08),
            padding: const EdgeInsets.all(12),
            borderRadius: BorderRadius.circular(6),
            child: const Text(
              '''flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/icons/''',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '⚠️ Important: Use 2 spaces for indentation. Incorrect spacing causes build errors.',
            style: TextStyle(
              fontSize: 11,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '💡 Tip: After modifying pubspec.yaml, run "flutter pub get"',
            style: TextStyle(fontSize: 11, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  // Helper Widgets

  Widget _buildIconDemo(IconData icon, String label, {bool isCupertino = false}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 32,
            color: isCupertino ? Colors.orange : Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 70,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeExample(String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Container(
          color: Colors.black.withOpacity(0.08),
          padding: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(6),
          child: Text(
            code,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 10,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconSizeDemo(double size, String label) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 16),
        Icon(Icons.star, size: size, color: Colors.amber),
        const SizedBox(width: 8),
        Icon(Icons.favorite, size: size, color: Colors.red),
        const SizedBox(width: 8),
        Icon(Icons.home, size: size, color: Colors.green),
      ],
    );
  }

  Widget _buildTroubleshootItem(String problem, String solution) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          problem,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          solution,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
