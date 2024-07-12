import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class InitialScreen extends StatefulWidget {

  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: const Text('Tarefas', style: TextStyle(color: Colors.white)),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task('Aprender Flutter', 'assets/images/dash.png', 3),
            Task('Rachar', 'assets/images/fut.jpg', 4),
            Task('Assistir o Corintia', 'assets/images/craque_neto.jpg', 5),
            Task('Jogar', 'assets/images/game.jpg', 2),
            Task('Descansar', 'assets/images/praia.jpeg', 1),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            opacity = !opacity;
          })
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
