import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final BorderRadius borderRadius;
  final bool elevated;

  const CustomCard({
    super.key,
    required this.child,
    required this.onTap,
    required this.borderRadius,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: elevated
          ? BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300.withOpacity(0.8),
                  blurRadius: 8.0,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                ),
              ],
            )
          : BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).cardColor,
            ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
