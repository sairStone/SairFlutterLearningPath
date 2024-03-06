import 'package:flutter/material.dart';
import 'package:flutter_app_muscidemo/models/song.dart';
import 'package:audioplayers/audioplayers.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  final List<Song> _playlist = [
    Song(
        songName: 'As It Was',
        artistName: 'Harry Styles',
        albumArtImagePath: 'images/album3.jpg',
        audioPath: 'audio/Harry Styles - As It Was.mp3'),
    Song(
        songName: '踊り子',
        artistName: 'Vaundy',
        albumArtImagePath: 'images/album1.jpg',
        audioPath: 'audio/Vaundy - 踊り子.mp3'),
    Song(
        songName: 'My Cookie Can',
        artistName: '卫兰',
        albumArtImagePath: 'images/album2.jpg',
        audioPath: 'audio/卫兰 - My Cookie Can.mp3'),
  ];

  int? _currentSongIndex;

  /// 音乐播放界面

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // initialliy not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;

    // print('this is path -----:'+path);

    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific postion in the current song
  void seek(Duration postion) async {
    await _audioPlayer.seek(postion);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // go to the next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it's the last song , loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() async {
    // if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
    } else {
      // if it's within first 2 seconds of the song, go to previous
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // listen to duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {});
  }

  // dispose audio player

  // getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    // update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    // update UI
    notifyListeners();
  }
}
