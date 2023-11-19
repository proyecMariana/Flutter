import 'package:flutter/material.dart';
import 'package:flutter_music/Common/my_routers.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset('assets/images/fondo_2.jpg'),
        Transform.translate(
          offset: const Offset(0, 100),
          child: const SizedBox(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileImage(),
                ProfileDetails(),
              ],
            ),
          )),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color.fromARGB(255, 106, 106, 102),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Salir'),
        ],
        onTap: (int index) {
          // Aquí puedes agregar lógica específica para cada ítem del BottomNavigationBar.
          // El índice (index) te dice qué ítem fue seleccionado (0, 1, 2, 3, etc.).
          // Puedes realizar acciones diferentes para cada ítem.
          if (index == 0) {
            Navigator.pushNamed(context, routePlayList);
          } else if (index == 1) {
            Navigator.pushNamed(context, routeLogin);
          }
        },
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7, // 0.8 significa una opacidad del 80%
      child: ClipOval(
        child: Image.asset(
          width: 200,
          height: 200,
          'assets/images/logo_4.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(223, 234, 234, 232), // Color gris claro
            borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
          ),
          width: 430, // Ancho del Container
          height: 300, // Alto del Container
          child: const Padding(
              padding: EdgeInsets.all(7.0),
              child: Text(
                '¡Bienvenido a tu mundo de sonidos! \n\n Con nuestra aplicación, descubre la música que amas, crea listas de reproducción únicas y sumérgete en un viaje auditivo personalizado. \n\n ¿Listo para escuchar la melodía de tu vida? \n\n ¡Vamos!',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'rligth',
                    fontSize: 18,
                    color: Color.fromARGB(255, 21, 21, 21)),
              )),
        ),
      ), //despues de esta va el parentesis
    );
  }
}
