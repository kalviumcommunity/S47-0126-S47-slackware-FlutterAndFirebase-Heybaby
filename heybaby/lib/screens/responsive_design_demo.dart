import 'package:flutter/material.dart';

class ResponsiveDesignDemo extends StatefulWidget {
  @override
  _ResponsiveDesignDemoState createState() => _ResponsiveDesignDemoState();
}

class _ResponsiveDesignDemoState extends State<ResponsiveDesignDemo> {
  String _selectedSection = 'intro';
  Orientation _currentOrientation = Orientation.portrait;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (mounted) {
      setState(() {
        _currentOrientation =
            MediaQuery.of(context).orientation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;
    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Design Demo'),
        backgroundColor: Colors.teal.shade600,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              // Section Navigation
              _buildSectionNavigation(),
              SizedBox(height: screenHeight * 0.02),

              // Current Section Display
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: _buildSelectedSection(screenWidth, screenHeight),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Screen Info Display
              _buildScreenInfoCard(screenWidth, screenHeight, orientation,
                  devicePixelRatio, padding),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigation buttons for different sections
  Widget _buildSectionNavigation() {
    var screenWidth = MediaQuery.of(context).size.width;
    var isSmallScreen = screenWidth < 600;

    List<Map<String, dynamic>> sections = [
      {'id': 'intro', 'label': 'Intro', 'icon': Icons.info},
      {'id': 'mediaquery', 'label': 'MediaQuery', 'icon': Icons.devices},
      {'id': 'layoutbuilder', 'label': 'LayoutBuilder', 'icon': Icons.architecture},
      {'id': 'mobile', 'label': 'Mobile', 'icon': Icons.phone_android},
      {'id': 'tablet', 'label': 'Tablet', 'icon': Icons.tablet},
      {'id': 'cards', 'label': 'Cards', 'icon': Icons.dashboard},
      {'id': 'form', 'label': 'Form', 'icon': Icons.edit},
      {'id': 'patterns', 'label': 'Patterns', 'icon': Icons.pattern},
    ];

    return isSmallScreen
        ? Column(
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: sections
                    .map((section) => _buildNavButton(section))
                    .toList(),
              ),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sections
                  .map((section) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: _buildNavButton(section),
                      ))
                  .toList(),
            ),
          );
  }

  /// Navigation button widget
  Widget _buildNavButton(Map<String, dynamic> section) {
    bool isSelected = _selectedSection == section['id'];
    return ElevatedButton.icon(
      onPressed: () => setState(() => _selectedSection = section['id']),
      icon: Icon(section['icon']),
      label: Text(section['label']),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? Colors.teal.shade600 : Colors.grey.shade300,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        elevation: isSelected ? 8 : 2,
      ),
    );
  }

  /// Build the selected section
  Widget _buildSelectedSection(double screenWidth, double screenHeight) {
    switch (_selectedSection) {
      case 'intro':
        return _buildIntroSection(screenWidth);
      case 'mediaquery':
        return _buildMediaQuerySection(screenWidth);
      case 'layoutbuilder':
        return _buildLayoutBuilderSection(screenWidth);
      case 'mobile':
        return _buildMobileLayoutSection(screenWidth, screenHeight);
      case 'tablet':
        return _buildTabletLayoutSection(screenWidth, screenHeight);
      case 'cards':
        return _buildResponsiveCardsSection(screenWidth);
      case 'form':
        return _buildResponsiveFormSection(screenWidth);
      case 'patterns':
        return _buildResponsivePatterns(screenWidth);
      default:
        return _buildIntroSection(screenWidth);
    }
  }

  /// Introduction section
  Widget _buildIntroSection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Understanding Responsive Design',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildBulletPoint(
          '📱 Adapts layouts automatically to different screen sizes',
          screenWidth,
        ),
        _buildBulletPoint(
          '🔄 Switches between portrait and landscape orientations',
          screenWidth,
        ),
        _buildBulletPoint(
          '⚖️ Uses relative sizing instead of fixed pixel dimensions',
          screenWidth,
        ),
        _buildBulletPoint(
          '🎯 Prevents overflow, clipping, and layout breaks',
          screenWidth,
        ),
        SizedBox(height: 20),
        Text(
          'Why It Matters:',
          style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        _buildBulletPoint(
          'Ensures smooth experience on phones, tablets, and foldables',
          screenWidth,
        ),
        _buildBulletPoint(
          'Reduces maintenance — one codebase for all devices',
          screenWidth,
        ),
        _buildBulletPoint(
          'Improves user satisfaction and app ratings',
          screenWidth,
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.teal.shade300),
          ),
          child: Text(
            '💡 Explore each section to learn how MediaQuery and LayoutBuilder work together to create truly responsive UIs!',
            style: TextStyle(fontSize: screenWidth * 0.04, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  /// MediaQuery section
  Widget _buildMediaQuerySection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MediaQuery: Getting Screen Information',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildBulletPoint(
          'Provides real-time screen dimensions, orientation, and device info',
          screenWidth,
        ),
        _buildBulletPoint(
          'Allows proportional sizing: width * 0.8 = 80% of screen width',
          screenWidth,
        ),
        _buildBulletPoint(
          'Detects device padding and notches automatically',
          screenWidth,
        ),
        SizedBox(height: 20),
        _buildCodeExample(
          'var screenWidth = MediaQuery.of(context).size.width;\nvar screenHeight = MediaQuery.of(context).size.height;\nvar orientation = MediaQuery.of(context).orientation;\nvar devicePixelRatio = MediaQuery.of(context).devicePixelRatio;',
          screenWidth,
        ),
        SizedBox(height: 20),
        Text(
          'Proportional Sizing Example:',
          style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12),
        Container(
          width: screenWidth * 0.8,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.teal.shade400, width: 2),
          ),
          child: Center(
            child: Text(
              '80% width container\n(screenWidth * 0.8)',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          width: screenWidth * 0.5,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange.shade400, width: 2),
          ),
          child: Center(
            child: Text(
              '50% width container',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  /// LayoutBuilder section
  Widget _buildLayoutBuilderSection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LayoutBuilder: Conditional Layouts',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildBulletPoint(
          'Receives layout constraints (maxWidth, maxHeight)',
          screenWidth,
        ),
        _buildBulletPoint(
          'Allows different UI structures based on available space',
          screenWidth,
        ),
        _buildBulletPoint(
          'Perfect for switching between Column (mobile) and Row (tablet)',
          screenWidth,
        ),
        SizedBox(height: 20),
        _buildCodeExample(
          'LayoutBuilder(\n  builder: (context, constraints) {\n    if (constraints.maxWidth < 600) {\n      return Column(children: [...]);\n    } else {\n      return Row(children: [...]);\n    }\n  },\n)',
          screenWidth,
        ),
        SizedBox(height: 20),
        Text(
          'Live Demo:',
          style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.purple.shade200,
                    child: Center(
                      child: Text(
                        '📱 Mobile: Column Layout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.purple.shade300,
                    child: Center(
                      child: Text(
                        'Stacked vertically',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.purple.shade200,
                      child: Center(
                        child: Text(
                          '💻 Tablet: Row Layout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.purple.shade300,
                      child: Center(
                        child: Text(
                          'Side by side',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  /// Mobile layout section
  Widget _buildMobileLayoutSection(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Layout (< 600px width)',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildBulletPoint('Vertical Column layout for better readability', screenWidth),
        _buildBulletPoint('Full-width components with padding', screenWidth),
        _buildBulletPoint('Touch-friendly spacing and button sizes', screenWidth),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '📱 Mobile View Example',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Header: Full Width', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Content: Stacked\n(No side panels)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Footer: Full Width', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Tablet layout section
  Widget _buildTabletLayoutSection(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tablet Layout (≥ 600px width)',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildBulletPoint('Horizontal Row layout to maximize space', screenWidth),
        _buildBulletPoint('Side-by-side panels for efficiency', screenWidth),
        _buildBulletPoint('Larger text and spacious components', screenWidth),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '💻 Tablet View Example',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Header: Full Width', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('Main Content\n(2/3 width)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('Sidebar\n(1/3 width)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Footer: Full Width', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Responsive cards grid section
  Widget _buildResponsiveCardsSection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Responsive Card Grid',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildBulletPoint('Automatically adjusts columns based on screen width', screenWidth),
        _buildBulletPoint('Mobile: 1 column | Tablet: 2 columns | Desktop: 3 columns',
            screenWidth),
        SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            int columns = 1;
            if (constraints.maxWidth > 900) {
              columns = 3;
            } else if (constraints.maxWidth > 600) {
              columns = 2;
            }
            
            List<String> cardTitles = [
              'Card 1',
              'Card 2',
              'Card 3',
              'Card 4',
              'Card 5',
              'Card 6',
            ];

            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: cardTitles.length,
              itemBuilder: (context, index) {
                Color cardColor = [
                  Colors.red.shade200,
                  Colors.blue.shade200,
                  Colors.green.shade200,
                  Colors.orange.shade200,
                  Colors.purple.shade200,
                  Colors.pink.shade200,
                ][index % 6];

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.dashboard, size: 40, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          cardTitles[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '$columns column${columns > 1 ? 's' : ''}',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  /// Responsive form section
  Widget _buildResponsiveFormSection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Responsive Form Layout',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildBulletPoint('Form fields adapt to screen width', screenWidth),
        _buildBulletPoint('Mobile: Stacked fields | Tablet: Side-by-side fields', screenWidth),
        SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
            
            if (isMobile) {
              return Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade600,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade600,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  /// Responsive patterns section
  Widget _buildResponsivePatterns(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Common Responsive Patterns',
          style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildPatternCard(
          'Pattern 1: Master-Detail',
          'Mobile: Stacked list and details\nTablet: List on left, details on right\nDesktop: Multi-panel layout',
          Colors.blue,
          screenWidth,
        ),
        SizedBox(height: 12),
        _buildPatternCard(
          'Pattern 2: Floating Action Button',
          'Mobile: FAB at bottom-right\nTablet: FAB or sidebar button\nDesktop: Menu integration',
          Colors.green,
          screenWidth,
        ),
        SizedBox(height: 12),
        _buildPatternCard(
          'Pattern 3: Navigation',
          'Mobile: Bottom nav or drawer\nTablet: Top nav + sidebar\nDesktop: Full navigation bar',
          Colors.orange,
          screenWidth,
        ),
        SizedBox(height: 12),
        _buildPatternCard(
          'Pattern 4: Flexible Spacing',
          'Use MediaQuery.of(context).size.width * 0.05\nfor consistent proportional spacing',
          Colors.purple,
          screenWidth,
        ),
      ],
    );
  }

  /// Pattern card widget
  Widget _buildPatternCard(
    String title,
    String description,
    Color color,
    double screenWidth,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: color.shade700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
        ],
      ),
    );
  }

  /// Screen info card
  Widget _buildScreenInfoCard(
    double screenWidth,
    double screenHeight,
    Orientation orientation,
    double devicePixelRatio,
    EdgeInsets padding,
  ) {
    String orientationText = orientation == Orientation.portrait ? 'Portrait' : 'Landscape';
    String deviceType = screenWidth < 600
        ? '📱 Mobile'
        : screenWidth < 1200
            ? '💻 Tablet'
            : '🖥️ Desktop';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Screen Information',
            style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          _buildInfoRow('Device Type', deviceType, screenWidth),
          _buildInfoRow('Screen Width', '${screenWidth.toStringAsFixed(0)}px', screenWidth),
          _buildInfoRow('Screen Height', '${screenHeight.toStringAsFixed(0)}px', screenWidth),
          _buildInfoRow('Orientation', orientationText, screenWidth),
          _buildInfoRow('Pixel Ratio', '${devicePixelRatio.toStringAsFixed(2)}x', screenWidth),
          _buildInfoRow('Safe Area Top', '${padding.top.toStringAsFixed(0)}px', screenWidth),
        ],
      ),
    );
  }

  /// Info row widget
  Widget _buildInfoRow(String label, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.teal.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Bullet point widget
  Widget _buildBulletPoint(String text, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
          ),
        ],
      ),
    );
  }

  /// Code example widget
  Widget _buildCodeExample(String code, double screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8),
        fontFamily: 'monospace',
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          code,
          style: TextStyle(
            fontFamily: 'Courier New',
            fontSize: screenWidth * 0.035,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
