import 'package:flutter/material.dart';
import 'package:flutter_music/Common/my_routers.dart';
import 'package:flutter_music/pages/play_list_page.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibir los datos de la canción desde ModalRoute
    final song = ModalRoute.of(context)!.settings.arguments as Song?;

// Asigna el objeto Song a la variable o campo si no es nulo.
    //final songToAssign = song ?? null;

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
                width: 200,
                height: 200,
                song?.albumArtUrl ?? 'assets/album/ima1.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              song?.title ?? 'Drive Breakbeat',
              style: const TextStyle(
                fontSize:
                    24, // Personaliza el tamaño de fuente según tus necesidades.
              ),
            ),
            Text(
              song?.subtitle ?? 'Rockot',
              style: const TextStyle(
                fontSize:
                    16, // Personaliza el tamaño de fuente según tus necesidades.
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
                    color: Color.fromARGB(255, 21, 21, 21)),
              ),
            )
            // Aquí puedes agregar la lógica de reproducción de la canción si es necesario.
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromARGB(255, 91, 91, 88),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Musica'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Salir'),
        ],
        onTap: (int index) {
          // Aquí puedes agregar lógica específica para cada ítem del BottomNavigationBar.
          // El índice (index) te dice qué ítem fue seleccionado (0, 1, 2, 3, etc.).
          // Puedes realizar acciones diferentes para cada ítem.
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
