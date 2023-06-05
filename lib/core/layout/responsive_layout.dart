import 'package:flutter/material.dart';

/// A responsive layout widget that adapts its child based on the screen size.
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget phone;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // If the screen width is less than or equal to 480, display the phone widget.
        if (constraints.maxWidth <= 480) {
          return phone;
        }
        // If the screen width is greater than 480 and less than or equal to 1080, display the tablet widget.
        else if (constraints.maxWidth > 480 && constraints.maxWidth <= 1080) {
          return tablet;
        }
        // For screen width greater than 1080, display the desktop widget.
        else {
          return desktop;
        }
      },
    );
  }
}
