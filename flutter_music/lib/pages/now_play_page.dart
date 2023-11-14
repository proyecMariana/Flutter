import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_music/Common/my_routers.dart';
import 'package:flutter_music/pages/play_list_page.dart';

class NowPlayingPage extends StatefulWidget {
  final Song song;

  const NowPlayingPage({Key? key, required this.song}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setFilePath(widget.song.mp3Path);
  }

  void _playAudio() {
    _audioPlayer.play();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproduciendo ahora'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                widget.song.albumArtUrl,
                width: 200,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              widget.song.title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              widget.song.subtitle,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Duis do nulla do eu voluptate labore et est nisi. Incididunt fugiat cillum aliquip irure enim Lorem cillum non sit incididunt et qui ea id. Pariatur nisi qui labore do enim reprehenderit veniam dolore id non sit occaecat aute. Enim anim ut duis non veniam dolore cupidatat consectetur est voluptate deserunt. Consequat commodo est consequat amet nulla proident consequat aute sit cupidatat. Culpa ad sunt minim labore veniam ullamco id sint id. Irure qui reprehenderit occaecat fugiat irure consequat excepteur exercitation dolore voluptate qui duis.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'rligth',
                  fontSize: 15,
                  color: Color.fromARGB(255, 21, 21, 21),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _playAudio,
              child: const Text('Reproducir'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color.fromARGB(255, 91, 91, 88),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Musica'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Salir'),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, routeHome);
          } else if (index == 1) {
            Navigator.pushNamed(context, routePlayList);
          } else if (index == 2) {
            Navigator.pushNamed(context, routeLogin);
          }
        },
      ),
    );
  }
}
