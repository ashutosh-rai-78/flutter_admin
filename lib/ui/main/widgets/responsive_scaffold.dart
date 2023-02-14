import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget appBartitle;
  final Widget Function(BuildContext? context, bool extended) navigationRail;
  final Widget bottomNavigationBar;
  final List<Widget> actions;
  final double? mobileMaxWidth;
  final double? tabletMaxWidth;
  final double? toolBarHeight;
  final Widget body;
  final Widget? leading;
  final bool? centerTitle;

  const ResponsiveScaffold(
      {super.key,
      required this.appBartitle,
      required this.navigationRail,
      required this.actions,
      this.mobileMaxWidth = 650,
      this.tabletMaxWidth,
      required this.bottomNavigationBar,
      this.toolBarHeight,
      required this.body,
      this.leading,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          centerTitle: centerTitle,
          leading: leading,
          backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: tabletMaxWidth,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              color: Theme.of(context).colorScheme.outline,
              height: 2,
            ),
          ),
          title: appBartitle,
          actions: actions),
      bottomNavigationBar: width < mobileMaxWidth! ? bottomNavigationBar : null,
      body: Row(
        children: [
          if (width >= mobileMaxWidth!)
            navigationRail(context, width >= tabletMaxWidth!),
          Expanded(child: body),
        ],
      ),
    );
  }
}
