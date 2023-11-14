import 'package:flutter/material.dart';
import 'package:flutter_music/Common/my_routers.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset('assets/images/fondo_2.jpg'),
        Transform.translate(
          offset: const Offset(0, 100),
          child: Column(
            children: [
              const ProfileImage(),
              ProfileDetails(),
            ],
          ),
        ),
      ]),
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
  final TextEditingController passwordController = TextEditingController();
  final String expectedPassword = '123456';

  ProfileDetails({super.key}); // Clave esperada

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 221, 221, 210), // Color gris claro
          borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
        ),
        width: 430, // Ancho del Container
        height: 250, // Alto del Container
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Form(
            child: Column(
              children: <Widget>[
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      //procesos
                      return null;
                    },
                    onSaved: (value) {
                      //procesos
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.password),
                    ),
                    obscureText: true,
                    validator: (value) {
                      //procesos
                      return null;
                    },
                    onSaved: (value) {
                      //procesos
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (passwordController.text == expectedPassword) {
                      Navigator.pushNamed(context, routeHome);
                    } else {
                      // Clave incorrecta, muestra una ventana modal
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error de Ingreso'),
                            content: const Text('La clave ingresada es incorrecta.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Cerrar la ventana modal
                                },
                                child: const Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 40, 155, 255),
                  ),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}