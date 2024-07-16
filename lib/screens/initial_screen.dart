import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int totalLvl = 0;

  void sumTotalLvl() {
    setState(() {
      totalLvl = TaskInherited.of(context).taskList.fold(0, (previousValue, element) => previousValue + element.nivel);
    });
  }

  @override
  Widget build(BuildContext context) {
    sumTotalLvl();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const SizedBox(),
          title: const Text('Tarefas', style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: IconButton(onPressed: sumTotalLvl, icon: const Icon(Icons.sync, color: Colors.white,)),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Nível: $totalLvl',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            )
          ),
        ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (newContext) => FormScreen(taskContext: context)
            )
          )
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
