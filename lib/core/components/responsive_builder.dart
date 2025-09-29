import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, this.mobile, this.tablet, this.desktop});

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    switch (MediaQuery.sizeOf(context).width) {
      case < 650:
        return mobile ?? SizedBox.shrink();
      case >= 650 && < 1300:
        return tablet ?? desktop ?? SizedBox.shrink();
      case >= 1300:
        return desktop ?? SizedBox.shrink();
      default:
        return mobile!;
    }
  }
}
