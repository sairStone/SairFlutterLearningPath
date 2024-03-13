import 'package:flutter/material.dart';
import 'package:flutter_app_muscidemo/pages/settting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Text('Sair Music',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          const SizedBox(height: 20,),

          ListTile(
            title: Text('home',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            leading: Icon(Icons.music_note,color: Theme.of(context).colorScheme.inversePrimary),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
              title: Text('setting',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
              leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.inversePrimary),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingPage()));
              }),
        ],
      ),
    );
  }
}
