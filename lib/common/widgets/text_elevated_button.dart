import 'package:flutter/material.dart';

class TextElevatedButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double radius;
  final Color? backgroundColor;

  const TextElevatedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.width,
      this.height,
      this.radius = 8,
      this.text,
      this.backgroundColor,
      this.padding})
      : super(key: key);

  const TextElevatedButton.text(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.height,
      this.radius = 8,
      this.backgroundColor,
      this.padding})
      : child = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: ButtonStyle(
            padding: padding != null ? MaterialStatePropertyAll(padding) : null,
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
            backgroundColor: MaterialStateProperty.all(backgroundColor ??
                Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.5))),
        onPressed: onPressed,
        child: child ?? (text != null ? Text(text!) : const SizedBox()),
      ),
    );
  }
}
