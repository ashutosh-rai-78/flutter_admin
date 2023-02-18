import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Sidebar'),
          ),
          ExpansionTile(
            title: Text('Expandable Item'),
            onExpansionChanged: (value) => _toggleExpanded(),
            children: [
              ListTile(
                title: Text('Item 1'),
              ),
              ListTile(
                title: Text('Item 2'),
              ),
              ListTile(
                title: Text('Item 3'),
              ),
            ],
          ),
          ListTile(
            title: Text('Item 4'),
          ),
          ListTile(
            title: Text('Item 5'),
          ),
        ],
      ),
    );
  }
}
