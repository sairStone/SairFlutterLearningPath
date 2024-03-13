import 'package:flutter/material.dart';
import 'package:flutter_app_muscidemo/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget child;

  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // if is darkMode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;


    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4),
          )
        ]
      ),
      padding: const EdgeInsets.all(15),
      child: child,
    );
  }
}