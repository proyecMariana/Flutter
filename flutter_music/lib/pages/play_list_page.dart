import 'package:flutter/material.dart';
import 'package:flutter_music/Common/my_routers.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  // lista de objetos Song que se pasan al widget como parámetro songs
  //En un proceso real esta informacion se debe consumir desde un api rest
  //que devuelva una respuesta en formato json
  final songs = [
    Song(
      title: 'Artista 1',
      subtitle: 'Rockot',
      albumArtUrl: 'assets/album/ima1.jpg',
      mp3Path: 'assets/mp3/tema_1.mp3',
    ),
    Song(
      title: 'Artista 2',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima2.jpg',
      mp3Path: 'assets/mp3/tema_2.mp3',
    ),
    Song(
      title: 'Artista 3',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima3.jpg',
      mp3Path: 'assets/mp3/tema_3.mp3',
    ),
    Song(
      title: 'Artista 4',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima4.jpg',
      mp3Path: 'assets/mp3/tema_1.mp3',
    ),
    Song(
      title: 'Artista 5',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima5.jpg',
      mp3Path: 'assets/mp3/tema_2.mp3',
    ),
    Song(
      title: 'Artista 6',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima6.jpg',
      mp3Path: 'assets/mp3/tema_3.mp3',
    ),
    Song(
      title: 'Artista 7',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima7.jpg',
      mp3Path: 'assets/mp3/tema_1.mp3',
    ),
    Song(
      title: 'Artista 8',
      subtitle: 'prazkhanal',
      albumArtUrl: 'assets/album/ima8.jpg',
      mp3Path: 'assets/mp3/tema_2.mp3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SongListView(songs: songs),
      //creando la barra inferior
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color.fromARGB(255, 60, 60, 59),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Salir'),
        ],
        onTap: (int index) {
          // Aquí puedes agregar lógica específica para cada ítem del BottomNavigationBar.
          // El índice (index) te dice qué ítem fue seleccionado (0, 1, 2, 3, etc.).
          // Puedes realizar acciones diferentes para cada ítem.
          if (index == 0) {
            Navigator.pushNamed(context, routeHome);
          } else if (index == 1) {
            Navigator.pushNamed(context, routeLogin);
          }
        },
      ),
    );
  }
}

class Song {
  final String title;
  final String subtitle;
  final String albumArtUrl;
  final String mp3Path;

  Song({
    required this.title,
    required this.subtitle,
    required this.albumArtUrl,
    required this.mp3Path,
  });
}

//Widget personalizado SonListView
class SongListView extends StatelessWidget {
  final List<Song> songs;

  const SongListView({
    Key? key,
    required this.songs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        final backgroundColor = index % 2 == 0
            ? Colors.white
            : const Color.fromARGB(255, 244, 241, 241);
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(song.albumArtUrl),
          ),
          title: Text(song.title),
          subtitle: Text(song.subtitle),
          trailing: IconButton(
            icon: const Icon(Icons.play_circle),
            onPressed: () {
              showDialogWithSong(context, song);
              Navigator.pushNamed(context, routNowPlay, arguments: song);
             },
          ),
          tileColor: backgroundColor,
        );
      },
    );
  }

  void showDialogWithSong(BuildContext context, Song song) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información de la Canción'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Título: ${song.title}'),
              Text('Subtítulo: ${song.subtitle}'),
              Text('Mp3: ${song.mp3Path}'),
              Text('Album: ${song.albumArtUrl}'),
              // Puedes agregar más información según tus necesidades
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}