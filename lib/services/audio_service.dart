import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  double _playbackRate = 1.0;

  AudioService() {
    _player.setReleaseMode(ReleaseMode.stop);
  }

  double get playbackRate => _playbackRate;

  void setPlaybackRate(double rate) {
    _playbackRate = rate;
    _player.setPlaybackRate(rate);
  }

  Future<void> playAsset(String assetPath) async {
    try {
      await _player.stop();
      await _player.setPlaybackRate(_playbackRate);
      final cleanPath = assetPath.startsWith('assets/')
          ? assetPath.replaceFirst('assets/', '')
          : assetPath;
      await _player.play(AssetSource(cleanPath));
    } catch (_) {}
  }

  Future<void> playUrl(String url) async {
    try {
      await _player.stop();
      await _player.setPlaybackRate(_playbackRate);
      await _player.play(UrlSource(url));
    } catch (_) {}
  }

  Future<void> stop() async {
    try {
      await _player.stop();
    } catch (_) {}
  }

  void dispose() {
    _player.dispose();
  }
}
