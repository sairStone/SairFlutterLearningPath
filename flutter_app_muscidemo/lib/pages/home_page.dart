import 'package:flutter/material.dart';

import 'package:flutter_app_muscidemo/components/my_drawer.dart';
import 'package:flutter_app_muscidemo/models/playlist_provider.dart';
import 'package:flutter_app_muscidemo/models/song.dart';
import 'package:flutter_app_muscidemo/pages/song_page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

/// 跳转去歌曲播放页面
  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SongPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
          title: Text('Home',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        ),
        body: Consumer<PlaylistProvider>(builder: (context, value, child) {
          final List<Song> playlist = value.playlist;

          return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final Song song = playlist[index];

                return ListTile(
                  title: Text(song.songName,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                  subtitle: Text(song.artistName,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                  leading: Image.asset('assets/'+song.albumArtImagePath),
                  onTap: () {
                    goToSong(index);
                  },
                );
              });
        }));
  }
}
