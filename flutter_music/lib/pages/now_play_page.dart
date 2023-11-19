import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_music/Common/my_routers.dart';
import 'package:flutter_music/pages/play_list_page.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';

class NowPlayingPage extends StatefulWidget {
  final Song song;

  const NowPlayingPage({Key? key, required this.song}) : super(key: key);

  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    var logger = Logger();
    try {
      // Verificar si la ruta del archivo MP3 es válida
      bool exists = await checkAssetExists(widget.song.mp3Path);
      if (exists) {
        // Limpiar el reproductor antes de cargar un nuevo archivo
        await _audioPlayer.stop();
        await _audioPlayer.seek(Duration.zero);

        // La ruta es válida, establecer el archivo MP3 en el reproductor de audio
        await _audioPlayer.setAsset(widget.song.mp3Path);
      } else {
        // La ruta no es válida
        logger.e(
            'La ruta del archivo MP3 no es válida. File: ${widget.song.mp3Path}');
      }
    } catch (e) {
      logger.e('Error message: $e');
    }
  }

  Future<bool> checkAssetExists(String assetPath) async {
    try {
      ByteData data = await rootBundle.load(assetPath);
      return data.lengthInBytes != 0;
    } catch (e) {
      return false; // Manejar cualquier excepción y considerar que el archivo no existe
    }
  }

  void _playAudio() async {
    try {
      await _audioPlayer.play();
    } catch (e) {
      var logger = Logger();
      logger.e('Error al reproducir el audio: $e');
    }
  }

  void _pauseAudio() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      var logger = Logger();
      logger.e('Error al pausar el audio: $e');
    }
  }

  void _stopAudio() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      var logger = Logger();
      logger.e('Error al detener el audio: $e');
    }
  }

  @override
  void dispose() {
    _stopAudio(); // Detener el audio al salir de la pantalla
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
        child: SingleChildScrollView(
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
                  'Duis do nulla do eu voluptate labore et est nisi.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'rligth',
                    fontSize: 15,
                    color: Color.fromARGB(255, 21, 21, 21),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: _playAudio,
                  ),
                  IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: _pauseAudio,
                  ),
                  IconButton(
                    icon: const Icon(Icons.stop),
                    onPressed: _stopAudio,
                  ),
                ],
              ),
            ],
          ),
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
