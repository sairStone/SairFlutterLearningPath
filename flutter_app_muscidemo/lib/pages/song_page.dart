import 'package:flutter/material.dart';
import 'package:flutter_app_muscidemo/components/neu_box.dart';
import 'package:flutter_app_muscidemo/models/playlist_provider.dart';
import 'package:provider/provider.dart';

// import 'package:audioplayers/audioplayers.dart';

///  音频测试代码
// void toPlay() async{
//   final player = AudioPlayer();
//   await player.play(AssetSource('audio/卫兰 - My Cookie Can.mp3'));
// }

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      // get playlist
      final playlist = value.playlist;

      //get current song index
      final currentSong = playlist[value.currentSongIndex ?? 0];

      // print(value.currentSongIndex);

    //  toPlay();

    // convert duration into min:sec
    String formatTime(Duration duration){
      String twoDigitSeconds = duration.inSeconds.remainder(50).toString().padLeft(2,'0');
      String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

      return formattedTime;
    }

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,color: Theme.of(context).colorScheme.inversePrimary,),
                    ),
                    Text("PLAYLIST",style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.inversePrimary),),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu,color: Theme.of(context).colorScheme.inversePrimary,),
                    )
                  ],
                ),
                NeuBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/${currentSong.albumArtImagePath}',
                          width: 300,
                          height: 300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,color: Theme.of(context).colorScheme.inversePrimary),
                                ),
                                Text(currentSong.artistName,style: TextStyle(
                                     color: Theme.of(context).colorScheme.inversePrimary)),
                              ],
                            ),
                            const Icon(Icons.favorite, color: Colors.red)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                /**
                       * 展示当前播放进度 以及 设置 是否循环播放，是否随机播放
                       */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text(formatTime(value.currentDuration),style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),

                          // shuffle icon
                          Icon(Icons.shuffle,color: Theme.of(context).colorScheme.inversePrimary,),

                          // repeat icon
                          Icon(Icons.repeat,color: Theme.of(context).colorScheme.inversePrimary,),

                          // end time
                          Text(formatTime(value.totalDuration),style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))
                        ],
                      )
                    ],
                  ),
                ),

                                /**
                     * song duration progress
                     */
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 0),
                  ),
                  child: Slider(
                    min: 0,
                    max: value.totalDuration.inSeconds.toDouble(),
                    value: value.currentDuration.inSeconds.toDouble(),
                    // max: 100,
                    // value: 10,
                    activeColor: Colors.green,
                    onChanged: (double double) {},
                    onChangeEnd: (double double) {
                      // sliding has finished,to to that position in song duration
                      value.seek(Duration(seconds: double.toInt()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                /**
                * 播放控制按钮
                */
                Row(
                  children: [
                    // skip previous
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                          child: GestureDetector(
                            onTap: value.playPreviousSong,
                            child: NeuBox(child: Icon(Icons.skip_previous,color: Theme.of(context).colorScheme.inversePrimary,)),
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    // play pause
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: GestureDetector(
                            onTap: value.pauseOrResume,
                            child: NeuBox(child: Icon( value.isPlaying ? Icons.pause : Icons.play_arrow, color: Theme.of(context).colorScheme.inversePrimary,)),
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    // skip forward
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                          child: GestureDetector(
                            onTap: value.playNextSong,
                            child: NeuBox(child: Icon(Icons.skip_next,color: Theme.of(context).colorScheme.inversePrimary)),
                          ),
                        )),
                  ],
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
