import 'package:flutter/material.dart';

class PageRefresh extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const PageRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => child,
        physics: const AlwaysScrollableScrollPhysics(),
      ),
    );
  }
}
