import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Layout')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.lightBlueAccent,
              child: Center(child: Text('Header Section')),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                      child: Center(child: Text('Left Panel')),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.greenAccent,
                      child: Center(child: Text('Right Panel')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
