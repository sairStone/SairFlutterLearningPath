import 'package:flutter/material.dart';
import 'package:flutter_app_muscidemo/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        title: Text('Setting',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text('Dark Mode',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            const SizedBox(
              width: 10,
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
